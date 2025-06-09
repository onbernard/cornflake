{
  inputs,
  overlays,
  ...
}:
with inputs; let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    system = system;
    overlays = overlays;
    config = {allowUnfree = true;};
  };
in
  nixpkgs.lib.nixosSystem {
    system = system;
    specialArgs = {inherit inputs pkgs;};
    modules = [
      # nixos-facter-modules.nixosModules.facter
      # {config.facter.reportPath = ./facter.json;}
      home-manager.nixosModules.home-manager
      chaotic.nixosModules.default
      stylix.nixosModules.stylix
      disko.nixosModules.disko
      ./configuration.nix
      ../../modules
    ];
  }
