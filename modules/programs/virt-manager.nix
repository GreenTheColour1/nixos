{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.virt-manager";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled = {
    programs.virt-manager.enable = true;

    environment.systemPackages = with pkgs; [
      virtio-win
      remmina
      cdrtools

      (writeShellScriptBin "makevirtiowiniso" ''
        mkisofs -o ~/Machines/ISOs/virtio-win.iso -J -R ${pkgs.virtio-win}
      '')
    ];
  };

  home.ifEnabled = {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        {
          directory = ".local/share/remmina";
          mode = "0750";
        }
        {
          directory = ".config/remmina";
          mode = "0750";
        }
        ".config/freerdp"
        ".config/libvirt"
      ];
    };
}
