{
  delib,
  pkgs,
  host,
  ...
}:
delib.module {
  name = "programs.lmstudio";

  options = delib.singleEnableOption host.aiFeatured;

  home.ifEnabled.home.packages = with pkgs; [ lmstudio ];

  # Model files (large). Best-effort dir; confirm in the VM.
  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [ ".lmstudio" ];
    };
}
