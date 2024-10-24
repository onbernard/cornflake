final: prev:
{
  intel-media-driver-git = prev.intel-media-driver.overrideAttrs (oldAttrs: {
    version = "24.4.0";
  });
}
