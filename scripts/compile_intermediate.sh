#!/bin/bash
out_dir="$(dirname "$0")/../intermediate"
[ ! -d "$out_dir" ] && mkdir "$out_dir"

yq < original/lists/minecraft.yaml \
  | jq '.[] | { "type": (if .path == "/" then "domain" else "path" end), "match": "literal" } * (if .path == "/" then { domain } else { "path": (.domain + .path) } end)' \
  | jq -s > "$out_dir/intermediate.json"
