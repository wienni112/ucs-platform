#!/usr/bin/env bash
set -euo pipefail

if [[ ! -f .env ]]; then
  echo "[INFO] No .env found. Copying .env.example to .env"
  cp .env.example .env
  echo "[INFO] Please edit .env before running this script again."
  exit 1
fi

if ! command -v docker >/dev/null 2>&1; then
  echo "[ERROR] docker is not installed."
  exit 1
fi

if ! docker compose version >/dev/null 2>&1; then
  echo "[ERROR] docker compose plugin is not installed."
  exit 1
fi

echo "[INFO] Pulling images..."
docker compose pull

echo "[INFO] Starting SOGo stack..."
docker compose up -d

echo "[INFO] Current container status:"
docker compose ps

echo "[NEXT] Configure NPM to proxy your public host to this service and wire LDAP / DB values in .env and config/sogo/sogo.conf."
