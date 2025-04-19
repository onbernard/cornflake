{
  description = "Onesime's corny flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {self, ...}:
    inputs.flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        mojo = pkgs.callPackage ./packages/mojo.nix {};
        linux-firmware-git = import ./overlays/linux-firmware-git;
        intel-media-driver-git = import ./overlays/intel-media-driver-git;
      in {
        packages = {
          mojo = mojo;
          linux-firmware-git = linux-firmware-git;
          intel-media-driver-git = intel-media-driver-git;
        };
        overlays.default = inputs.nixpkgs.lib.composeExtensions intel-media-driver-git linux-firmware-git;
        devShells.default = pkgs.mkShell {
          packages = [mojo];
        };
      }
    );
}
