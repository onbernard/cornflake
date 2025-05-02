#!/usr/bin/env nix-shell
#!nix-shell -i bash -p git

set -eu -o pipefail

repo="https://github.com/intel/media-driver.git"

revision="$(git ls-remote --refs --tags --sort refname $repo | grep -E "intel-media-[0-9]+\.[0-9]+\.[0-9]+" | tail -n1 | cut -f2 | cut -d '/' -f3 | cut -d '-' -f3)"

sed -i -E "s/(version\s*=\s*\").*(\";)/\1$revision\2/" ./default.nix

