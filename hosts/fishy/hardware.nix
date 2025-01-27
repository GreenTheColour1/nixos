{ delib, modulesPath, lib, config, ... }:
delib.host {
  name = "nixos-fishy";

  homeManagerSystem = "x86_64-linux";
  home.home.stateVersion = "24.05";

  nixos = {
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "24.05";

    imports = [(modulesPath + "/installer/scan/not-detected.nix")];

    boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/56110539-a427-43c9-8e8b-397e1f2fc27c";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/D18E-DD50";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };
    
    fileSystems."/home/fishy/Data" = {
      device = "/dev/disk/by-uuid/e5da78c3-c09e-4d49-a67f-f331fb2979c5";
      fsType = "ext4";
      options = [
        "users"
        "rw"
        "auto"
        "exec"
      ];
    };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/0d0088e8-c258-4ae6-83cc-8a09fa625e1a"; }
      ];

    networking.useDHCP = lib.mkDefault true;

    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
