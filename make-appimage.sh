#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q audiotube | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook:get-yt-dlp.src.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/org.kde.audiotube.svg
export DESKTOP=/usr/share/applications/org.kde.audiotube.desktop
export DEPLOY_QT=1
export QT_DIR=qt6
export DEPLOY_PIPEWIRE=1

# Deploy dependencies
quick-sharun /usr/bin/audiotube

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
