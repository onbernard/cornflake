final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "4ccb15a9dbfad4490f3b40382eb1789e97115821";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "4ccb15a9dbfad4490f3b40382eb1789e97115821";
    };
  });
}
