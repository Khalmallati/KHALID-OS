#!/bin/sh
set -eu

echo "Checking KHALID OS build environment..."

if [ "$(id -u)" -ne 0 ]; then
    echo "ERROR: Build must run as root."
    exit 1
fi

for tool in lb debootstrap xorriso mksquashfs; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "ERROR: Missing tool: $tool"
        exit 1
    fi
done

if [ ! -f auto/config ]; then
    echo "ERROR: auto/config not found."
    exit 1
fi

if [ ! -f scripts/build-iso.sh ]; then
    echo "ERROR: scripts/build-iso.sh not found."
    exit 1
fi

echo "Environment check passed."
