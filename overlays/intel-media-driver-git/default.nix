final: prev:
{
  intel-media-driver-git = prev.intel-media-driver.overrideAttrs (oldAttrs: {
    version = "25.2.0";
  });
}
