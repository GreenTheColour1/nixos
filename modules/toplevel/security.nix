{ delib, pkgs, ... }:
delib.module {
  name = "security";

  options = delib.singleEnableOption true;

  nixos.ifEnabled.security.sudo = {
    enable = true;
    extraRules = [
      {
        commands = [
          {
            command = "${pkgs.grub2}/bin/grub-reboot 2";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
}
