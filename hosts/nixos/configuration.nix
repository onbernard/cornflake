{
  modulesPath,
  lib,
  pkgs,
  ...
}: let
  stateVersion = "25.05";
in {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ./disk-config.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub = {
      efiSupport = true;
      efiInstallAsRemovable = true;
      # devices = ["/dev/sda"];
    };
  };

  services.openssh.openFirewall = lib.mkForce true;
  chaotic.nyx.cache.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  system.stateVersion = stateVersion;
  nix.settings = {
    experimental-features = ["nix-command" "flakes" "pipe-operators"];
  };
  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "x86_64-linux";
  };
  networking = {
    hostName = "nixos";
    useDHCP = lib.mkDefault true;
  };
}
