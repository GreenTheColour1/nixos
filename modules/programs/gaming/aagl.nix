{
  delib,
  inputs,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.aagl";

  options.programs.aagl = with delib; {
    enable = boolOption host.isDesktop;
    enableAnimeGameLauncher = boolOption true;
    enableSleepyLauncher = boolOption true;
  };

  nixos.always = {
    imports = [ inputs.aagl.nixosModules.default ];
    nix.settings = {
      substituters = [ "https://ezkea.cachix.org" ];
      trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
    };
  };
  nixos.ifEnabled =
    { cfg, ... }:
    {
      programs.anime-game-launcher.enable = cfg.enableAnimeGameLauncher;
      programs.sleepy-launcher.enable = cfg.enableSleepyLauncher;
    };
}
