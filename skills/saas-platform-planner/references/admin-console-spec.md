# Admin Console Spec

## Goal
Create a terminal UI that lets the app owner operate the full SaaS stack from SSH without memorizing Docker commands.

## Required scripts

```text
scripts/admin/
  appctl                    # main CLI entrypoint
  menu.sh                   # interactive menu
  lib/common.sh             # shared helpers
  actions/status.sh
  actions/start.sh
  actions/stop.sh
  actions/restart.sh
  actions/logs.sh
  actions/deploy.sh
  actions/backup-db.sh
  actions/restore-db.sh
  actions/migrate.sh
  actions/health.sh
```

## Menu hierarchy

```text
Main Menu
  1) Service control
     - Start all
     - Stop all
     - Restart all
     - Restart web
     - Restart api
     - Restart database
  2) Logs and diagnostics
     - Live logs all
     - Live logs web
     - Live logs api
     - Show compose status
     - Run health checks
  3) Database
     - Backup database now
     - List backups
     - Restore backup
     - Run migrations
  4) Deployment
     - Deploy latest changes
     - Build images
     - Pull images
     - Rollback instructions
  5) Maintenance
     - Prune unused Docker images
     - Show disk usage
     - Renew/reload proxy
  0) Exit
```

## Safety rules
- All scripts must use `set -Eeuo pipefail`.
- Dangerous actions must require typed confirmation, not just yes/no.
- Restore must create a pre-restore backup first.
- Deploy must run a backup before migrations in production.
- Scripts must print exact Docker Compose command on failure.
- Scripts must never echo secrets.

## CLI examples

```bash
./scripts/admin/appctl status
./scripts/admin/appctl logs web
./scripts/admin/appctl backup-db
./scripts/admin/appctl restore-db backup-file.sql.gz
./scripts/admin/appctl deploy
./scripts/admin/appctl menu
```
