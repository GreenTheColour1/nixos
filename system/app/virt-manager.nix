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
          (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          }).fd
        ];
      };
      vhostUserPackages = with pkgs; [
        virtio-win
        virtiofsd
      ];
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
