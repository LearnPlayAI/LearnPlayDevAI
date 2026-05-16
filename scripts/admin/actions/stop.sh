#!/bin/bash
set -Eeuo pipefail
echo "promptly.app: stop.sh"
cd "$(dirname "$0")/../compose" && docker compose down
