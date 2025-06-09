# Solution thanks to:
# https://www.reddit.com/r/NixOS/comments/1khgybw/asus_zenbook_s14_speaker_not_working_ux5406sa/
final: prev: {
  alsa-ucm-conf-git = prev.alsa-ucm-conf.overrideAttrs (oldAttrs: rec {
    version = "421e37bae75efc1fc134fbc84bc301f041aaff3b";
    src = fetchTarball {
      url = "https://github.com/alsa-project/alsa-ucm-conf/archive/${version}.tar.gz";
      sha256 = "sha256:08rsv6wn32d9zrw1gl2jp7rqzj8m6bdkn0xc7drzf9gfbf6fvmpb";
    };
    # Override the installPhase to avoid problematic substitutions
    installPhase = ''
      mkdir -p $out/share/alsa
      cp -r ucm2 $out/share/alsa/
    '';
    # Disable postInstall to avoid substitutions
    postInstall = "";
  });
}
