{
  description = "Onesime's corny flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";    
  };

  outputs = inputs@{ self, ... }:
  {
    overlays = {
      default = final: prev: import ./overlays/linux-firmware-git final prev;
    };
  };
}
