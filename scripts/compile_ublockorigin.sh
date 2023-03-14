#!/bin/bash

if ! which jq >/dev/null; then
  echo "jq is required" >&2
  exit 1
fi

if ! which git >/dev/null; then
  echo "git is required" >&2
  exit 1
fi

out_dir="$(dirname "$0")/../dist/minecraft"

[ ! -d "$out_dir" ] && mkdir "$out_dir"

dist="$out_dir/ublockorigin.txt"
if [ -f "$dist" ]; then
  rm "$dist"
fi

output() {
  echo "$1" >> "$dist"
}

output "! This blacklist is powered by https://github.com/KisaragiEffective/PortableFormatOfIllegalModSites"
output "! Generated-Date: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
output "! Git-Commit: $(git rev-parse HEAD)"
output "! SPDX-License-Identifier: CC-BY-SA-4.0"
output "! Please see above GitHub repository for more information about license."

data="$(dirname "$0")/../intermediate/intermediate.json"
jq -r '.[] | select(.type == "domain") | .domain | ("||" + . + "^")' < "$data" >> "$dist"
jq -r '.[] | select(.type == "path") | .path | ("||" + . + "^")' < "$data" >> "$dist"