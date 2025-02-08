final: prev:
{
  intel-media-driver-git = prev.intel-media-driver.overrideAttrs (oldAttrs: {
    version = "25.1.0";
  });
}
