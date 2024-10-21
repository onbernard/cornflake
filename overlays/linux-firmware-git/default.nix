final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "08bb5322f49b5828fb0d6acb20826e47a321ec3c";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "08bb5322f49b5828fb0d6acb20826e47a321ec3c";
    };
  });
}
