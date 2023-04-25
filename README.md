# PortableFormatOfIllegalModSites

## purpose
* Integrate [StopModReposts/Illegal-Mod-Sites](https://github.com/StopModReposts/Illegal-Mod-Sites) with present blocker (uBlock origin, uBlacklist)

## use

Refer them by the raw URL to use.

* `dist/minecraft/ublacklist.txt` - uBlacklist, hide from search result
* `dist/minecraft/ublockorigin_google.txt` - uBlock Origin, hide from search result on (only) Google
* `dist/minecraft/ublockorigin.txt` - uBlock Origin, issues if you jump into the *problematic* site

## compilation

Alternatively, you can compile:

1. Run `scripts/compile_intermediate.sh`
2. Grub [`exclude_entry_compiler`](https://github.com/KisaragiEffective/exclude_entry_compiler)
3. Choice your target.
  * `compile_ublacklist.sh`
  * `compile_ublockorigin_google.sh`
  * `compile_ublockorigin.sh`

## license

See `LICENSE.md`, redistribution and modification to the lists are allowed if you follow some conditions. 
