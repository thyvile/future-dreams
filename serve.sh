#!/usr/bin/env bash
set -euo pipefail

PORT=${1:-8000}
ROOT="$(cd "$(dirname "$0")" && pwd)"
cd "$ROOT"

printf 'Serving FUTURE DREAMS at http://localhost:%s/reality.html\n' "$PORT"
python3 -m http.server "$PORT"
