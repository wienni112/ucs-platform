#!/usr/bin/env bash
set -euo pipefail

backup_dir="${1:-./backups/$(date +%F_%H-%M-%S)}"
mkdir -p "$backup_dir"

cp -a .env "$backup_dir/.env" 2>/dev/null || true
cp -a config "$backup_dir/config"

echo "[INFO] Config backup created in $backup_dir"
