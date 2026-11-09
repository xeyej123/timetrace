#!/usr/bin/env bash
set -euo pipefail
project_root=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
target="${XDG_DATA_HOME:-$HOME/.local/share}/gnome-shell/extensions/timetrace@timetrace.app"
if [[ -e "$target" ]]; then
    backup="${XDG_DATA_HOME:-$HOME/.local/share}/timetrace-extension-backups/$(date +%Y%m%dT%H%M%S)-$$"
    mkdir -p "$backup"
    cp -a "$target" "$backup/"
    echo "Previous extension backed up to $backup"
fi
mkdir -p "$target"
cp "$project_root/src/timetrace/assets/gnome_extension/metadata.json" "$project_root/src/timetrace/assets/gnome_extension/extension.js" "$target/"
echo 'Log out and log back in to load the updated extension, then run:'
echo 'gnome-extensions enable timetrace@timetrace.app'
