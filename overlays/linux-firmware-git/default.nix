final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "3c9f887a81aea0a69a3ec141602fef15603b56f4";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "3c9f887a81aea0a69a3ec141602fef15603b56f4";
    };
  });
}
