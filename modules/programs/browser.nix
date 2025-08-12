{
  delib,
  pkgs,
  host,
  inputs,
  ...
}:
delib.module {
  name = "programs.browser";

  options.programs.browser = with delib; {
    enable = boolOption host.guiFeatured;
    defaultBrowserBin = strOption "zen-beta";
  };

  home.always.imports = [ inputs.zen-browser.homeModules.beta ];

  home.ifEnabled = {
    programs.zen-browser = {
      enable = true;
    };

    home.packages = [
      pkgs.brave
    ];
  };

  nixos.ifEnabled.environment.sessionVariables = {
    MOZ_DISABLE_RDD_SANDBOX = 1;
  };
}
