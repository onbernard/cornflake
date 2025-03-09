final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "bd3d8a8b1bb76e352ea8d60db8198f0b40ff9ac8";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "bd3d8a8b1bb76e352ea8d60db8198f0b40ff9ac8";
    };
  });
}
