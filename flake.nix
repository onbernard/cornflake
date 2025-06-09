{
  description = "Onesime's corny flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
  };

  outputs = inputs @ {self, ...}:
    inputs.flake-utils.lib.eachDefaultSystem (
      system: let
        linux-firmware-git = import ./overlays/linux-firmware-git;
        intel-media-driver-git = import ./overlays/intel-media-driver-git {inherit pkgs;};
        alsa-ucm-conf-git = import ./overlays/alsa-ucm-conf-git;

        overlays = [linux-firmware-git intel-media-driver-git alsa-ucm-conf-git];

        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = overlays;
        };

        mojo = pkgs.callPackage ./packages/mojo.nix {};
        magic = pkgs.callPackage ./packages/magic.nix {};

        iso = import ./configurations/iso {inherit inputs;};
      in {
        packages = {
          mojo = mojo;
          magic = magic;
          linux-firmware-git = pkgs.linux-firmware-git;
          intel-media-driver-git = pkgs.intel-media-driver-git;
          alsa-ucm-conf-git = pkgs.alsa-ucm-conf-git;
          iso = iso.config.system.build.isoImage;
        };
        overlays.default = inputs.nixpkgs.lib.composeExtensions intel-media-driver-git linux-firmware-git alsa-ucm-conf-git;
        devShells.default = pkgs.mkShell {
          packages = [mojo magic];
        };
        nixosConfigurations = {
          nixos = import ./hosts/nixos {inherit inputs;};
        };
      }
    );
}
