#!/bin/bash
set -Eeuo pipefail
echo "promptly.app: status.sh"
cd "$(dirname "$0")/../compose" && docker compose ps
