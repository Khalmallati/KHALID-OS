#!/bin/sh
for c in lb debootstrap xorriso mksquashfs; do command -v "$c" >/dev/null 2>&1 && echo "[OK] $c" || echo "[MISSING] $c"; done
echo "Host: $(uname -m)"; df -h .
