{
  delib,
  pkgs,
  host,
  config,
  ...
}:
delib.module {
  name = "nvidia";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled = {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = [
      "nvidia"
    ];

    hardware.nvidia = {
      modesetting.enable = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NVD_BACKEND = "direct";
      # __GL_GSYNC_ALLOWED = 1;
    };
  };
}
