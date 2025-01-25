{ delib, host, inputs, ...}:
delib.module {
  name = "services.flatpak";

  options = with delib; {
    enable = boolOption host.isDesktop;
    packages = listOfOption str [];
  };

  nixos.always.imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];
  home.always.imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  nixos.ifEnabled.services.flatpak.enable = true;
  home.ifEnabled = { cfg, ... }: {
    services.flatpak = {
      enabled = true;
      packages = cfg.packages;
    };
  };
}
