final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "9e1d9ae6ef3d3e00e8551266b9c96ea1ace814e4";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "9e1d9ae6ef3d3e00e8551266b9c96ea1ace814e4";
    };
  });
}
