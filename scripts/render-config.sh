#!/usr/bin/env bash
set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SOGO_DIR="${BASE_DIR}/sogo"

if [[ ! -f "${SOGO_DIR}/.env" ]]; then
  echo "ERROR: ${SOGO_DIR}/.env not found"
  exit 1
fi

if [[ ! -f "${SOGO_DIR}/config/sogo/sogo.conf.template" ]]; then
  echo "ERROR: sogo.conf.template not found"
  exit 1
fi

set -a
source "${SOGO_DIR}/.env"
set +a

mkdir -p "${SOGO_DIR}/generated"

envsubst < "${SOGO_DIR}/config/sogo/sogo.conf.template" > "${SOGO_DIR}/generated/sogo.conf"

echo "Rendered: ${SOGO_DIR}/generated/sogo.conf"
