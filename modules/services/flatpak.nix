{
  delib,
  host,
  inputs,
  lib,
  ...
}:
delib.module {
  name = "services.flatpak";

  options = with delib; {
    services.flatpak = {
      enable = boolOption host.guiFeatured;
      packages = listOfOption (attrsOf str) [ ];
    };
  };

  # nixos.always.imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
  home.always.imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  nixos.ifEnabled.services.flatpak.enable = true;

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      directories = [ "/var/lib/flatpak" ];
      users.${myconfig.constants.username}.directories = [
        ".local/share/flatpak"
        ".var/app"
      ];
    };
  home.ifEnabled =
    { cfg, ... }:
    {
      services.flatpak = {
        enable = true;
        update.auto.enable = true;
        update.auto.onCalendar = "weekly";
        uninstallUnmanaged = true;
        packages = cfg.packages;
        remotes = lib.mkOptionDefault [
          {
            name = "flathub-beta";
            location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
          }
          {
            name = "dolphin-emu";
            location = "https://flatpak.dolphin-emu.org/releases.flatpakrepo";
          }

        ];
      };
    };
}
