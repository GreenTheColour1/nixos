{ delib, modulesPath, lib, ... }:
delib.host {
  name = "vm-test";

  homeManagerSystem = "x86_64-linux";
  home.home.stateVersion = "24.05";

  nixos = {
    nixpkgs.hostPlatform = "x86_64-linux";
    system.stateVersion = "24.05";

    imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];

    networking.useDHCP = lib.mkDefault true;

    # No static fileSystems/swapDevices here on purpose: the disko
    # module (myconfig.disko.enable, set in default.nix) provides /,
    # /persist and /boot. Extra data disks are never touched.

    # VM-only tuning: applies solely to `build-vm` output, never to
    # bare metal. Headless by default (serial console + forwarded SSH);
    # flip graphics + add virgl qemu.options if a GUI is needed.
    virtualisation.vmVariant = {
      virtualisation = {
        memorySize = 8192;
        cores = 4;
        diskSize = 20480;
        resolution = {
          x = 1920;
          y = 1080;
        };
        graphics = false;
        forwardPorts = [
          {
            from = "host";
            host.port = 2222;
            guest.port = 22;
          }
        ];
      };

      virtualisation.sharedDirectories.ageKey = {
        source = "/home/fishy/.config/sops/age";
        target = "/mnt/age-key";
      };
    };
  };
}
