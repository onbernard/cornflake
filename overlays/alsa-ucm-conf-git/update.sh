#!/usr/bin/env nix-shell
#!nix-shell -i bash -p git

set -eu -o pipefail

repo="https://github.com/alsa-project/alsa-ucm-conf"

revision="$(git ls-remote "$repo" HEAD | cut -f1)"

url="https://github.com/alsa-project/alsa-ucm-conf/archive/$revision.tar.gz"

hash="$(nix-prefetch-url --unpack "$url")"

sed -i "s/\(version = \)\"[^\"]*\"/\1\"$revision\"/" ./default.nix

sed -i "s|\(sha256 = \)\"[^\"]*\"|\1\"sha256:$hash\"|" ./default.nix

