#!/usr/bin/env bash
set -euo pipefail

PORT=${1:-8000}
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

HOST_LABEL="http://localhost:${PORT}/reality.html"
if [[ -n ${CODESPACE_NAME:-} ]]; then
  HOST_LABEL="https://${CODESPACE_NAME}-${PORT}.app.github.dev/reality.html"
elif [[ -n ${CLOUDENV:-} ]]; then
  HOST_LABEL="http://0.0.0.0:${PORT}/reality.html (forward this port to view from Codex)"
fi

printf 'Serving FUTURE DREAMS at %s\n' "$HOST_LABEL"
python3 -m http.server --bind 0.0.0.0 "$PORT"
