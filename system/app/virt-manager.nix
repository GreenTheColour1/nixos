{ pkgs, ... }:
{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;
      ovmf = {
        enable = true;
        packages = [
          pkgs.OVMFFull.fd
        ];
      };
    };
  };

  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  environment.systemPackages = with pkgs; [
    virtio-win
    remmina

    (writeShellScriptBin "makevirtiowiniso" ''
      mkisofs -o ~/Machines/ISOs/virtio-win.iso -J -R ${pkgs.virtio-win}
    '')
  ];
}
