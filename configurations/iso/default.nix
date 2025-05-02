{inputs, ...}:
with inputs; let
in
  nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      chaotic.nixosModules.default
      ({pkgs, ...}: {
        imports = ["${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"];
        boot.kernelPackages = pkgs.linuxPackages_cachyos;
        boot.supportedFilesystems = {
          btrfs = true;
          zfs = nixpkgs.lib.mkForce false;
        };
      })
    ];
  }
