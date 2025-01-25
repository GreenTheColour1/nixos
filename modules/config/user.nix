{delib, ...}:
delib.module {
  name = "user";

  nixos.always = {myconfig, ...}: let
    inherit (myconfig.constants) username;
  in {
    users = {
      groups.${username} = {};

      users.${username} = {
        isNormalUser = true;
        description = username;
        extraGroups = [
          "networkmanager"
          "wheel"
          "input"
          "uinput"
          "libvirtd"
        ];
        uid = 1000;
      };
    };
  };
}
