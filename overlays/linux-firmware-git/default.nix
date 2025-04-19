final: prev:
{
  linux-firmware-git = prev.linux-firmware.overrideAttrs (oldAttrs: {
    version = "2f411c10e4570d03426d3cb095471aa1120114ab";
    src = builtins.fetchGit {
      url = "https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git";
      rev = "2f411c10e4570d03426d3cb095471aa1120114ab";
    };
  });
}
