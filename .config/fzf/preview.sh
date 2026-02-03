#!/usr/bin/env bash

[[ -z "$1" ]] && exit 0
[[ -d "$1" ]] && eza -a --icons=always --tree --level=1 "$1" && exit 0
[[ ! -f "$1" ]] && exit 0

case $(file --mime-type -b "$1") in
  image/*) kitten icat --clear --transfer-mode=memory --stdin=no \
             --place="${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}@0x0" "$1" ;;
  *)       bat --style=numbers --color=always --line-range=:300 "$1" ;;
esac
