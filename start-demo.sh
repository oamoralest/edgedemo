#!/usr/bin/env bash

set -euo pipefail

PORT="${1:-8000}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if command -v python3 >/dev/null 2>&1; then
  PYTHON_CMD="python3"
elif command -v python >/dev/null 2>&1; then
  PYTHON_CMD="python"
else
  echo "Python not found. Please install Python 3."
  exit 1
fi

if [ ! -f "${ROOT_DIR}/index.html" ]; then
  echo "Could not find index.html in: ${ROOT_DIR}"
  exit 1
fi

echo "Starting Edge AI demo from: ${ROOT_DIR}"
echo "Local URL: http://localhost:${PORT}"
echo "Press Ctrl+C to stop."

open_browser() {
  local url="$1"
  if command -v open >/dev/null 2>&1; then
    open "$url" >/dev/null 2>&1 || true
  elif command -v xdg-open >/dev/null 2>&1; then
    xdg-open "$url" >/dev/null 2>&1 || true
  elif command -v cmd.exe >/dev/null 2>&1; then
    cmd.exe /c start "$url" >/dev/null 2>&1 || true
  fi
}

open_browser "http://localhost:${PORT}"
cd "${ROOT_DIR}"
exec "${PYTHON_CMD}" -m http.server "${PORT}"
