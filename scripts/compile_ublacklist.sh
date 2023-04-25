#!/bin/bash

if ! which git >/dev/null; then
  echo "git is required" >&2
  exit 1
fi

out_dir="$(dirname "$0")/../dist/minecraft"
dist="$out_dir/ublacklist.txt"
intermediate="$(dirname "$0")/../intermediate"

exclude_entry_compiler compile \
  --target uBlackList \
  -i "$intermediate/intermediate.json" \
  -o "$dist" \
  --feature-flag Base \
  -h "SPDX-License-Identifier=CC-BY-SA-4.0" \
  -h "Generated-Date=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -h "Git-Commit=$(git rev-parse HEAD)" \
  -h "Git-Commit-Upstream=$(cat "$intermediate/upstream-commit.txt")" \
  -h "Git-Repository=https://github.com/KisaragiEffective/PortableFormatOfIllegalModSites/" \
