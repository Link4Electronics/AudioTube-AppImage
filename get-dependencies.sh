#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm     \
    audiotube               \
    ca-certificates         \
    ca-certificates-utils   \
    ca-certificates-mozilla \
    futuresql               \
    nodejs                  \
    pipewire-audio          \
    pipewire-jack           \
    python-ytmusicapi       \
    qqc2-desktop-style

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano ffmpeg-mini
