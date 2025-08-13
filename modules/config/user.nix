{ delib, config, ... }:
delib.module {
  name = "user";

  nixos.always =
    { myconfig, ... }:
    let
      inherit (myconfig.constants) username;
    in
    {
      users = {
        sops.secrets.password.neededForUsers = true;

        groups.${username} = { };

        users.${username} = {
          isNormalUser = true;
          hashedPasswordFile = config.sops.secrets.password.path;
          description = username;
          extraGroups = [
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
