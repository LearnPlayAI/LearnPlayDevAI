#!/bin/bash
set -Eeuo pipefail
echo "promptly.app: health.sh"
curl -sf http://localhost:8080/api/health && curl -sf http://localhost/health
