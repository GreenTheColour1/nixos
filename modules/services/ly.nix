{
  delib,
  pkgs,
  myconfig,
  ...
}:
delib.module {
  name = "services.ly";

  options = delib.singleEnableOption false;

  nixos.ifEnabled =
    { myconfig, ... }:
    {
      services.displayManager = {
        ly = {
          enable = true;
          x11Support = false;

          settings = {
            auto_login_session = "hyprland-standalone";
            save_file_dir = null;
          };
        };

        defaultSession =
          if myconfig.programs.hyprland.enable == true then
            "hyprland"
          else if myconfig.programs.niri.enable == true then
            "niri"
          else
            null;

        autoLogin.enable = true;
        autoLogin.user = myconfig.constants.username;
      };

      # Standalone Hyprland session, visible only to ly (ly crawls
      # /etc/ly/custom-sessions in addition to the system session dirs).
      # Mirrors hyprland.desktop's Exec via the stable system path, but
      # with a unique id so autologin can't resolve to hyprland-uwsm.
      environment.etc."ly/custom-sessions/hyprland-standalone.desktop".text = ''
        [Desktop Entry]
        Name=Hyprland (standalone)
        Comment=Hyprland compositor launched directly, without uwsm
        Exec=/run/current-system/sw/bin/start-hyprland
        Type=Application
        DesktopNames=Hyprland
      '';
    };
}
