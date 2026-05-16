#!/bin/bash
set -Eeuo pipefail
echo "promptly.app: migrate.sh"
cd "$(dirname "$0")/../compose" && docker compose exec promptly-api java -jar /app.jar flyway:migrate
