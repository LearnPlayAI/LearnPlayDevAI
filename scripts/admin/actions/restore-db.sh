#!/bin/bash
set -Eeuo pipefail
echo "promptly.app: restore-db.sh"
cd "$(dirname "$0")/../compose" && read -rp "SQL file: " f && docker compose exec -T promptly-db psql -U postgres promptly < "$f"
