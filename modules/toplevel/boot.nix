{
  delib,
  pkgs,
  config,
  ...
}:
delib.module {
  name = "boot";

  options.boot = with delib; {
    enable = boolOption true;

    mode = enumOption [ "uefi" "legacy" ] (
      if builtins.pathExists /sys/firmware/efi/efivars then "uefi" else "legacy"
    );
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      environment.systemPackages = with pkgs; [
        grub2
        os-prober
      ];
      boot.kernelPackages = pkgs.linuxPackages_latest;

      boot.loader = {
        efi = {
          canTouchEfiVariables = true;
        };

        systemd-boot = {
          enable = true;
          # efiSupport = cfg.mode == "uefi"; # This ends up not being true on uefi systems FIXME
          # efiSupport = true;
          # device = "nodev";
          # useOSProber = true;
        };
      };

      # boot.extraModulePackages = with config.boot.kernelPackages; [ xpadneo ];

      boot.kernelParams = [
        "amd_pstate=active"
        "initcall_blacklist=simpledrm_platform_driver_init" # Fix ghost monitor
      ];
    };
}
