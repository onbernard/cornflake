{
  description = "Onesime's corny flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";    
  };

  outputs = inputs@{ self, ... }:
  with inputs;
  flake-utils.lib.eachDefaultSystem (system:
  let
    overlays = [
      (import ./overlays/linux-firmware-git)
    ];
    pkgs = import nixpkgs { inherit system; overlays = overlays; };
  in
  {
    overlays = overlays;
    packages = {
      "linux-firmware-git" = with pkgs; [ linux-firmware-git ];
    };
    devShell = pkgs.mkShell {
      buildInputs = with pkgs; [ git ];
    };
  });
}
