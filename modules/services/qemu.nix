{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "services.qemu";

  options = delib.singleEnableOption host.isDesktop;

  nixos.isEnabled.virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu;
        # TPM emulation
        swtpm.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };

    spiceUSBRedirection.enable = true;

    user.extraGroups = [ "libvertd" ];
  };
}
