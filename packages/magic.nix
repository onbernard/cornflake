{
  lib,
  stdenv,
  fetchurl,
}: let
  cpu = stdenv.hostPlatform.parsed.cpu.name;
  kernel = stdenv.hostPlatform.parsed.kernel.name;
  platform =
    if kernel == "linux"
    then "unknown-linux-musl"
    else if kernel == "darwin"
    then "apple-darwin"
    else throw "Unsupported platform: ${kernel}";
  arch =
    if cpu == "x86_64"
    then "x86_64"
    else if cpu == "arm64" || cpu == "aarch64"
    then "aarch64"
    else throw "Unsupported platform: ${cpu}";
in
  stdenv.mkDerivation rec {
    pname = "magic";
    version = "0.7.2";

    src = fetchurl {
      url = "https://dl.modular.com/public/magic/raw/versions/${version}/magic-${arch}-${platform}";
      sha256 = "sha256-L+zh1XH9RD+XqcxC1A9V9a09ZN6bda84e4khLimN7NU=";
    };

    phases = ["installPhase"];

    installPhase = ''
      mkdir -p $out/bin
      cp $src $out/bin/magic
      chmod +x $out/bin/magic
    '';

    meta = with lib; {
      description = "Magic package manager for the mojo programming language";
      homepage = "https://docs.modular.com/magic/";
      platforms = platforms.linux ++ platforms.darwin;
      maintainers = [];
      license = licenses.unfree;
    };
  }
