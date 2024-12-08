final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "7e1bc11980a4528af56a91d7989ec75e3fea78e3";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "7e1bc11980a4528af56a91d7989ec75e3fea78e3";
    };
  });
}
