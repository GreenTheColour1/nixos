{ delib, pkgs, ... }:
delib.module {
  name = "security";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    security.sudo = {
      enable = true;
    };

    security.polkit.enable = true;

    environment.systemPackages = [ pkgs.hyprpolkitagent ];

    systemd.user.services.hyprpolkitagent = {
      description = "Hyprland Polkit agent";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
