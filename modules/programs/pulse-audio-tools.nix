{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.pulse-audio-tools";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled = {
    programs.noisetorch = {
      enable = true;
    };
  };

  home.ifEnabled = {
    home.packages = [
      pkgs.pwvucontrol
      pkgs.pamixer
    ];
  };
}
