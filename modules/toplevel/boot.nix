{ delib, pkgs, config, ... }:
delib.module {
  name = "boot";

  options.boot = with delib; {
    enable = boolOption true;

    mode = enumOption ["uefi" "legacy"] (
      if builtins.pathExists /sys/firmware/efi/efivars
      then "uefi"
      else "legacy"
    );
  };

  nixos.ifEnabled = { cfg, ... }: {
    boot.kernelPackages = pkgs.linuxPackages_latest;

    boot.loader = {
      efi = {
        canTouchEfiVariables = true;
      };

      grub = {
        enable = true;
        efiSupport = cfg.mode == "uefi";
        device = "nodev";
        useOSProber = true;
      };
    };

    boot.extraModulePackages = with config.boot.kernelPackages; [ xpaneo ];

    boot.kernelParams = [
      "amd_pstate=active"
    ];
  };
}
