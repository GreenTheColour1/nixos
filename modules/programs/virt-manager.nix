{ delib, pkgs, host, ... }:
delib.module {
  name = "programs.virt-manager";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled = {
    programs.virt-manager.enable = true;

    environment.systemPackages = with pkgs; [
      virtio-win
      remmina

      (writeShellScriptBin "makevirtiowiniso" ''
        mkisofs -o ~/Machines/ISOs/virtio-win.iso -J -R ${pkgs.virtio-win}
      '')
    ];
  };
}
