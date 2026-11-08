#!/bin/sh
set -eu

ROOT="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
cd "$ROOT"

if [ "$(id -u)" -ne 0 ]; then
  echo "ERROR: Run as root"
  exit 1
fi

command -v lb >/dev/null 2>&1 || {
  echo "ERROR: live-build is not installed"
  exit 1
}

lb clean --purge || true
lb config
lb build

mkdir -p output

ISO="$(find "$ROOT" -maxdepth 1 -type f -name '*.iso' -print -quit)"

if [ -z "$ISO" ]; then
  echo "ERROR: ISO file not found"
  exit 1
fi

cp "$ISO" output/KHALID-OS-Cloud-1.0-i386.iso
sha256sum output/KHALID-OS-Cloud-1.0-i386.iso > output/SHA256SUMS

echo "KHALID OS ISO build completed"
