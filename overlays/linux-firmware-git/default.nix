final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "ad74054cd57db9401caf9c1c0b340b667d322216";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "ad74054cd57db9401caf9c1c0b340b667d322216";
    };
  });
}
