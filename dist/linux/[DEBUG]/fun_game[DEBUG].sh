#!/bin/sh
echo -ne '\033c\033]0;GWJ Game\a'
base_path="$(dirname "$(realpath "$0")")"
"$base_path/fun_game[DEBUG].x86_64" "$@"
