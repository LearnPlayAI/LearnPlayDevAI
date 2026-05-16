#!/bin/bash
set -Eeuo pipefail
echo "promptly.app: logs.sh"
cd "$(dirname "$0")/../compose" && docker compose logs -f
