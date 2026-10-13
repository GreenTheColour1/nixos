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
    enableSecureBoot = boolOption false;
  };

  nixos.always.imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  # Without this, the enrolled secure-boot keys are lost on every wipe
  # and the machine needs re-enrolling to boot.
  # No inInitrd: lanzaboote reads the bundle at bootloader-install time
  # (lzbt install hook, i.e. nixos-rebuild/disko-install on the running
  # system) and via multi-user.target units — never from early boot.
  # Firmware verifies against enrolled keys; the ESP holds the signatures.
  preservation.ifEnabled =
    { myconfig, ... }:
    if myconfig.boot.enableSecureBoot then
      {
        directories = [ "/var/lib/sbctl" ];
      }
    else
      { };

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      environment.systemPackages = with pkgs; [
        sbctl
      ];
      boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

      boot.loader = {
        efi = {
          canTouchEfiVariables = true;
        };
        systemd-boot = {
          enable = lib.mkForce (!myconfig.boot.enableSecureBoot);
        };
      };

      boot.lanzaboote = {
        enable = myconfig.boot.enableSecureBoot;
        pkiBundle = "/var/lib/sbctl";
      };

      boot.extraModulePackages = with config.boot.kernelPackages; [ xpadneo ];

      boot.kernelParams = [
        "amd_pstate=active"
        "initcall_blacklist=simpledrm_platform_driver_init" # Fix ghost monitor
      ];
    };
}
