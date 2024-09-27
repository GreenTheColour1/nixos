{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    # wine-staging (version with experimental features)
    wineWowPackages.staging

    # winetricks (all versions)
    winetricks
  ];
}
