final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "384e300b5571df30740c4be7becfd6a0922352e2";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "384e300b5571df30740c4be7becfd6a0922352e2";
    };
  });
}
