{
  description = "Onesime's corny flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";    
  };

  outputs = inputs@{ self, ... }:
  with inputs;
  let
    linux-firmware-git = import ./overlays/linux-firmware-git;
    intel-media-driver-git = import ./overlays/intel-media-driver-git;
  in
  {
    overlays = {
      default =  nixpkgs.lib.composeExtensions intel-media-driver-git linux-firmware-git;
    };
    devShells.x86_64-linux.default = 
    let
      pkgs = import nixpkgs { system = "x86_64-linux"; overlays = [ self.overlays.default]; };
    in
    nixpkgs.legacyPackages.x86_64-linux.mkShell {
      buildInputs = [ pkgs.linux-firmware-git pkgs.intel-media-driver-git ];
    };
  };
}
