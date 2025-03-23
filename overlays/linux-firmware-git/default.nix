final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "710a336b31981773a3a16e7909fd83daeaec9db1";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "710a336b31981773a3a16e7909fd83daeaec9db1";
    };
  });
}
