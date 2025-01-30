{
  delib,
  pkgs,
  config,
  lib,
  inputs,
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

  nixos.always.imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  nixos.ifEnabled =
    { cfg, ... }:
    {
      environment.systemPackages = with pkgs; [
        sbctl
      ];
      boot.kernelPackages = pkgs.linuxPackages_latest;

      boot.loader = {
        efi = {
          canTouchEfiVariables = true;
        };
        systemd-boot = {
          enable = lib.mkForce false;
        };
      };

      boot.lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      };

      # boot.extraModulePackages = with config.boot.kernelPackages; [ xpadneo ];

      boot.kernelParams = [
        "amd_pstate=active"
        "initcall_blacklist=simpledrm_platform_driver_init" # Fix ghost monitor
      ];
    };
}
