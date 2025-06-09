{pkgs, ...}: final: prev: {
  intel-media-driver-git = prev.intel-media-driver.overrideAttrs (oldAttrs: rec {
    version = "25.2.4";
    src = pkgs.fetchFromGitHub {
      owner = "intel";
      repo = "media-driver";
      rev = "intel-media-${version}";
      hash = "sha256-tfI7jeNWN7v35wrdEY2fczaaRBRwvmL3K1gwYlU/V80=";
    };
  });
}
