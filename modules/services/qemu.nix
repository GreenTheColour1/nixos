{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "services.qemu";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      virtualisation = {
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
      };

      users.users.${myconfig.constants.username}.extraGroups = [ "libvertd" ];
    };
}
