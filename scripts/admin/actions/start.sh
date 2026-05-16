#!/bin/bash
set -Eeuo pipefail
echo "promptly.app: start.sh"
cd "$(dirname "$0")/../compose" && docker compose up -d
