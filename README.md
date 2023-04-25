# PortableFormatOfIllegalModSites

## purpose
* Integrate [StopModReposts/Illegal-Mod-Sites](https://github.com/StopModReposts/Illegal-Mod-Sites) with present blocker (uBlock origin, uBlacklist)

## use

Refer them by the raw URL to use.

## compilation

Alternatively, you can compile:

1. Run `scripts/compile_intermediate.sh`
2. Grub [`exclude_entry_compiler`](https://github.com/KisaragiEffective/exclude_entry_compiler)
3. Choice your target.
  * `compile_ublacklist.sh` - create block rules for ublacklist.
  * `compile_ublacklist_google.sh` - create block rules for ublacklist. only effective on Google search sites.
  * `compile_ublockorigin.sh`

## license

See LICENSE.md
