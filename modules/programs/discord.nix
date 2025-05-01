{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:
delib.module {
  name = "programs.discord";

  options = delib.singleEnableOption host.isDesktop;

  home.always.imports = [ inputs.nixcord.homeModules.nixcord ];

  home.ifEnabled = {
    # home.packages = with pkgs; [ vesktop ];

    programs.nixcord = {
      enable = true;
      config = {
        frameless = true;
      };
    };
  };
}
