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
      extraPackages = with pkgs; [ nvidia-vaapi-driver ];
    };

    services.xserver.videoDrivers = [
      "nvidia"
    ];

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

    environment.sessionVariables = {
      LIBVA_DRIVER_NAME = "nvidia";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      NVD_BACKEND = "direct";
      VDPAU_DRIVER = "nvidia";
      EGL_PLATFORM = "wayland";
      # __GL_GSYNC_ALLOWED = 1;
    };

    # Needed or else system failes to wake up after suspend
    systemd.services."nvidia-unload" = {
      description = "Unload NVIDIA modules before suspend";
      before = [ "sleep.target" ];
      wantedBy = [ "sleep.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.kmod}/bin/modprobe -r nvidia_drm nvidia_modeset nvidia_uvm nvidia";
      };
    };

    systemd.services."nvidia-reload" = {
      description = "Reload NVIDIA modules after resume";
      after = [ "suspend.target" ];
      wantedBy = [ "suspend.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.kmod}/bin/modprobe nvidia nvidia_modeset nvidia_uvm nvidia_drm";
      };
    };
  };
}
