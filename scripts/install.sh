#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "${BASE_DIR}"

echo "[1/3] Rendering SOGo configuration..."
./scripts/render-config.sh

echo "[2/3] Starting containers..."
docker compose -f sogo/docker-compose.yml --env-file sogo/.env up -d

echo "[3/3] Done."
echo "SOGo should now be reachable behind your reverse proxy."
