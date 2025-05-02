# Cornflake

Me precious flake.

With

- iso: standard nixos minimal iso but with cachyos kernel. The normal one does not run on newer hardware or vms.
- linux-firmware-git: linux-firmware (usually) pointing to the latest commit of [the upstream repo](https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git)
- intel-media-driver-git: intel-media-driver (usually) pointing to the latest tag of [the upstream repo](https://github.com/intel/media-driver.git)
- mojo: stolen from https://github.com/noverby/noverby/blob/main/config/packages/mojo.nix
- magic: package manager for mojo
