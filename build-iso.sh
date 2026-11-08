#!/bin/sh
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"
[ "$(id -u)" -eq 0 ] || { echo "Run with sudo"; exit 1; }
command -v lb >/dev/null 2>&1 || { echo "Install live-build first"; exit 1; }
chmod +x auto/config
lb clean --purge || true
lb config
lb build
mkdir -p output
ISO=$(find "$ROOT" -maxdepth 1 -type f -name '*.iso' -print -quit)
[ -n "$ISO" ] || { echo "ISO not found; inspect live-build.log"; exit 2; }
cp "$ISO" output/KHALID-OS-Cloud-1.0-i386.iso
sha256sum output/KHALID-OS-Cloud-1.0-i386.iso > output/SHA256SUMS
