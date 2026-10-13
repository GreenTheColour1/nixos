{
  delib,
  inputs,
  ...
}:
delib.module {
  name = "disko";

  options.disko = with delib; {
    enable = boolOption false;
    # Disk disko is allowed to partition and FORMAT. Defaults to a
    # VM-style device on purpose: enabling this on bare metal without
    # setting the real disk (e.g. "/dev/nvme0n1") fails instead of
    # wiping the wrong drive. Applies ONLY to this disk; other disks
    # (e.g. /home/fishy/Data, /mnt/winvm) are left untouched.
    device = strOption "/dev/vda";
  };

  nixos.always.imports = [ inputs.disko.nixosModules.disko ];

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      disko.devices = {
        disk.main = {
          type = "disk";
          device = myconfig.disko.device;
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                };
              };
              swap = {
                size = "16G";
                content = {
                  type = "swap";
                };
              };
              root = {
                size = "100%";
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "/persist" = {
                      mountOptions = [
                        "subvol=persist"
                        "noatime"
                        "compress=zstd"
                      ];
                      mountpoint = "/persist";
                    };
                    "/nix" = {
                      mountOptions = [
                        "subvol=nix"
                        "noatime"
                        "compress=zstd"
                      ];
                      mountpoint = "/nix";
                    };
                  };
                };
              };
            };
          };
        };
        nodev."/" = {
          fsType = "tmpfs";
          mountOptions = [
            "size=25%"
            "mode=755"
          ];
        };
      };

      # Both must be mounted in initrd: /nix holds stage-2 (an empty
      # tmpfs / has no store to boot from) and /persist backs inInitrd
      # preservation (e.g. /etc/machine-id).
      fileSystems."/persist".neededForBoot = true;
      fileSystems."/nix".neededForBoot = true;
    };
}
