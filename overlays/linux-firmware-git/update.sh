#!/usr/bin/env nix-shell
#!nix-shell -i bash -p git

set -eu -o pipefail

repo="https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"

revision="$(git ls-remote "$repo" HEAD | cut -f1)"

sed -i -E "s/(version\s*=\s*\").*(\";)/\1$revision\2/" ./default.nix

sed -i -E "s/(rev\s*=\s*\").*((\";|}))/\1$revision\2/" ./default.nix
