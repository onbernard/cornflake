final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "d864697fd38a94092b636c8030843343f265fe69";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "d864697fd38a94092b636c8030843343f265fe69";
    };
  });
}
