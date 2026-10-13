{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.deadlock-mod-manager";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled.home.packages = [ pkgs.deadlock-mod-manager ];

  # Best-effort data dir; confirm with `find ~ -iname '*deadlock*'` in the VM.
  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [ ".config/deadlock-mod-manager" ];
    };
}
