#!/bin/bash
set -Eeuo pipefail
echo "promptly.app: restart.sh"
cd "$(dirname "$0")/../compose" && docker compose restart
