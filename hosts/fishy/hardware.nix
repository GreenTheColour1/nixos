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

    # NOTE: mkDefault so the opt-in disko module (myconfig.disko.enable)
    # can take over / and /boot when enabled. Untouched otherwise.
    fileSystems."/" = lib.mkDefault {
      device = "/dev/disk/by-uuid/56110539-a427-43c9-8e8b-397e1f2fc27c";
      fsType = "ext4";
    };

    fileSystems."/boot" = lib.mkDefault {
      device = "/dev/disk/by-uuid/D18E-DD50";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };
    
    fileSystems."/home/fishy/Data" = lib.mkDefault {
      device = "/dev/disk/by-uuid/e5da78c3-c09e-4d49-a67f-f331fb2979c5";
      fsType = "ext4";
      options = [
        "users"
        "rw"
        "auto"
        "exec"
      ];
    };

    # TARGET STATE (btrfs, inert until cutover — do NOT enable before
    # converting, or the mount fails and Data just stays absent):
    #
    #   fileSystems."/home/fishy/Data" = lib.mkDefault {
    #     device = "/dev/disk/by-label/Data";
    #     fsType = "btrfs";
    #     options = [ "users" "rw" "auto" "exec" "noatime" ];
    #   };
    #
    # Design notes:
    # - disko deliberately does NOT manage this disk: every disko-install
    #   run formats all declared disks, and bulk data must survive OS
    #   reinstalls. Only the mount is declared here.
    # - No compress=zstd (unlike /persist): SteamLibrary blobs and qcow2
    #   images are already compressed/encrypted — zstd would burn CPU for
    #   ~zero gain. noatime avoids write churn on bulk reads.
    # - LABEL (not UUID): stable across the conversion below.
    #
    # Cutover (one-time, ~635G live data — backup first, sda has room):
    #   1. Close everything using Data (steam, VMs), then unmount it.
    #   2. e2fsck -f /dev/nvme1n1p1
    #   3. btrfs-convert /dev/nvme1n1p1   # in place, keeps an ext4
    #                                     # rollback snapshot; reversible
    #                                     # with `btrfs-convert -r` until
    #                                     # the snapshot is deleted
    #   4. btrfs filesystem label /dev/nvme1n1p1 Data
    #   5. Mount, then defragment the converted data:
    #        btrfs filesystem defragment -r /home/fishy/Data
    #   6. Swap the live entry above for the target block, rebuild,
    #      verify the data, then drop the rollback snapshot:
    #        btrfs subvolume delete /home/fishy/Data/ext2_saved

    swapDevices = lib.mkDefault [
      { device = "/dev/disk/by-uuid/0d0088e8-c258-4ae6-83cc-8a09fa625e1a"; }
    ];

    networking.useDHCP = lib.mkDefault true;

    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
