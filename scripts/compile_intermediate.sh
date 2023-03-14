#!/bin/bash
out_dir="$(dirname "$0")/../intermediate"
cache_file="$out_dir/upstream-commit.txt"

function upstream() {
  git rev-parse HEAD:original
}

if [ -f "$cache_file" ]; then
  commit="$(tr -d '\n' < "$cache_file")"
  if [ "$commit" == "$(upstream)" ]; then
    echo "Fresh: original" >&2
    exit 0
  else
    rm "$cache_file"
    printf "%s" "$(upstream)" > "$cache_file"
  fi
else
  printf "%s" "$(upstream)" > "$cache_file"
fi

[ ! -d "$out_dir" ] && mkdir "$out_dir"

yq < original/lists/minecraft.yaml \
  | jq '.[] | { "type": (if .path == "/" then "domain" else "path" end), "match": "literal" } * (if .path == "/" then { domain } else { "path": (.domain + .path) } end)' \
  | jq -s > "$out_dir/intermediate.json"
