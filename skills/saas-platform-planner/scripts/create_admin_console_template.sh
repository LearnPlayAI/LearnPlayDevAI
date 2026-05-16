#!/usr/bin/env bash
set -Eeuo pipefail

TARGET_DIR="${1:-.}"
ADMIN_DIR="$TARGET_DIR/scripts/admin"
ACTIONS_DIR="$ADMIN_DIR/actions"
LIB_DIR="$ADMIN_DIR/lib"

mkdir -p "$ACTIONS_DIR" "$LIB_DIR"

cat > "$LIB_DIR/common.sh" <<'SH'
#!/usr/bin/env bash
set -Eeuo pipefail

APP_NAME="${APP_NAME:-myapp}"
COMPOSE_FILE="${COMPOSE_FILE:-infra/compose/docker-compose.yml}"
ENV_FILE="${ENV_FILE:-/opt/${APP_NAME}/shared/env/.env.prod}"
BACKUP_DIR="${BACKUP_DIR:-/opt/${APP_NAME}/shared/backups/postgres}"

compose() {
  docker compose --env-file "$ENV_FILE" -f "$COMPOSE_FILE" "$@"
}

require_file() {
  if [[ ! -f "$1" ]]; then
    echo "Missing required file: $1" >&2
    exit 1
  fi
}

confirm_typed() {
  local expected="$1"
  local prompt="$2"
  echo "$prompt"
  read -r value
  if [[ "$value" != "$expected" ]]; then
    echo "Confirmation failed. Expected: $expected" >&2
    exit 1
  fi
}
SH

cat > "$ADMIN_DIR/appctl" <<'SH'
#!/usr/bin/env bash
set -Eeuo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/lib/common.sh"

cmd="${1:-menu}"
shift || true
case "$cmd" in
  menu) exec "$SCRIPT_DIR/menu.sh" ;;
  status) compose ps ;;
  start) compose up -d ;;
  stop) compose down ;;
  restart) compose restart "${1:-}" ;;
  logs) compose logs -f --tail=200 "${1:-}" ;;
  health) compose ps && compose logs --tail=80 ;;
  deploy) "$SCRIPT_DIR/actions/deploy.sh" ;;
  backup-db) "$SCRIPT_DIR/actions/backup-db.sh" ;;
  restore-db) "$SCRIPT_DIR/actions/restore-db.sh" "${1:-}" ;;
  migrate) "$SCRIPT_DIR/actions/migrate.sh" ;;
  *) echo "Unknown command: $cmd" >&2; exit 1 ;;
esac
SH
chmod +x "$ADMIN_DIR/appctl"

cat > "$ADMIN_DIR/menu.sh" <<'SH'
#!/usr/bin/env bash
set -Eeuo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
while true; do
  clear
  cat <<'MENU'
Main Menu
  1) Status
  2) Start all
  3) Stop all
  4) Restart all
  5) Live logs
  6) Backup database
  7) Restore database
  8) Deploy latest changes
  9) Health check
  0) Exit
MENU
  read -rp "Choose: " choice
  case "$choice" in
    1) "$SCRIPT_DIR/appctl" status ;;
    2) "$SCRIPT_DIR/appctl" start ;;
    3) "$SCRIPT_DIR/appctl" stop ;;
    4) "$SCRIPT_DIR/appctl" restart ;;
    5) "$SCRIPT_DIR/appctl" logs ;;
    6) "$SCRIPT_DIR/appctl" backup-db ;;
    7) read -rp "Backup file: " f; "$SCRIPT_DIR/appctl" restore-db "$f" ;;
    8) "$SCRIPT_DIR/appctl" deploy ;;
    9) "$SCRIPT_DIR/appctl" health ;;
    0) exit 0 ;;
    *) echo "Invalid choice" ;;
  esac
  read -rp "Press Enter to continue..." _
done
SH
chmod +x "$ADMIN_DIR/menu.sh"

cat > "$ACTIONS_DIR/backup-db.sh" <<'SH'
#!/usr/bin/env bash
set -Eeuo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$SCRIPT_DIR/lib/common.sh"
mkdir -p "$BACKUP_DIR"
stamp="$(date +%Y%m%d-%H%M%S)"
out="$BACKUP_DIR/${APP_NAME}-postgres-$stamp.sql.gz"
compose exec -T postgres pg_dump -U "${POSTGRES_USER:-postgres}" "${POSTGRES_DB:-app}" | gzip > "$out"
echo "Backup written: $out"
SH
chmod +x "$ACTIONS_DIR/backup-db.sh"

cat > "$ACTIONS_DIR/restore-db.sh" <<'SH'
#!/usr/bin/env bash
set -Eeuo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$SCRIPT_DIR/lib/common.sh"
backup="${1:-}"
if [[ -z "$backup" || ! -f "$backup" ]]; then
  echo "Usage: appctl restore-db /path/to/backup.sql.gz" >&2
  exit 1
fi
"$SCRIPT_DIR/actions/backup-db.sh"
confirm_typed "RESTORE" "Type RESTORE to overwrite the current database from $backup"
gunzip -c "$backup" | compose exec -T postgres psql -U "${POSTGRES_USER:-postgres}" "${POSTGRES_DB:-app}"
echo "Restore complete"
SH
chmod +x "$ACTIONS_DIR/restore-db.sh"

cat > "$ACTIONS_DIR/deploy.sh" <<'SH'
#!/usr/bin/env bash
set -Eeuo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$SCRIPT_DIR/lib/common.sh"
require_file "$ENV_FILE"
"$SCRIPT_DIR/actions/backup-db.sh"
compose build
"$SCRIPT_DIR/actions/migrate.sh"
compose up -d --remove-orphans
compose ps
compose logs --tail=80
SH
chmod +x "$ACTIONS_DIR/deploy.sh"

cat > "$ACTIONS_DIR/migrate.sh" <<'SH'
#!/usr/bin/env bash
set -Eeuo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$SCRIPT_DIR/lib/common.sh"
if compose ps api >/dev/null 2>&1; then
  compose run --rm api ./mvnw -q flyway:migrate || true
fi
if compose ps web >/dev/null 2>&1; then
  compose run --rm web sh -lc 'npm run db:migrate || npx prisma migrate deploy || true'
fi
SH
chmod +x "$ACTIONS_DIR/migrate.sh"

echo "Admin console template created at $ADMIN_DIR"
