final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "e1d95775eb3db64ab3740701bf9682e5856aab2e";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "e1d95775eb3db64ab3740701bf9682e5856aab2e";
    };
  });
}
