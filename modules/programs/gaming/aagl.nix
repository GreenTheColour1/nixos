{
  delib,
  inputs,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.aagl";

  options.aagl = with delib; {
    enable = boolOption host.isDesktop;
    enableAnimeGameLauncher = boolOption true;
    enableSleepyLauncher = boolOption true;
  };

  nixos.always.imports = [ inputs.aagl.nixosModules.default ];
  nixos.ifEnabled = {
    nix.settings = inputs.aagl.nixConfig;
  };

  home.ifEnabled = { cfg, ... }: {
    nix.settings = inputs.aagl.nixConfig;

    home.packages = with inputs.anime-launcher.packages.${pkgs.system};
    (lib.optional cfg.enableAnimeGameLauncher anime-game-launcher)
    ++ (lib.optional cfg.enableSleepyLauncher sleepy-launcher);
  };
}
