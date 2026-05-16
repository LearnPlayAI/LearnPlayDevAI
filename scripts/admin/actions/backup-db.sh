#!/bin/bash
set -Eeuo pipefail
echo "promptly.app: backup-db.sh"
cd "$(dirname "$0")/../compose" && docker compose exec promptly-db pg_dump -U postgres promptly
