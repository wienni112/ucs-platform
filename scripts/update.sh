#!/usr/bin/env bash
set -euo pipefail

docker compose pull
docker compose up -d

echo "[INFO] Pruning dangling images..."
docker image prune -f

docker compose ps
