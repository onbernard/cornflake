final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "4f0106cf1943acb6458d6d17c4e40bf68458d790";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "4f0106cf1943acb6458d6d17c4e40bf68458d790";
    };
  });
}
