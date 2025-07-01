{ delib, pkgs, ... }:
delib.module {
  name = "programs.waybar";

  home.ifEnabled.programs.waybar = {
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        modules-left = [
          "custom/icon"
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [
          "mpris"
        ];
        modules-right = [
          "tray"
          "cpu"
          "temperature"
          "memory"
          "network"
          "pulseaudio"
          "clock"
        ];
        "custom/icon" = {
          "format" = " ";
          "on-click" = "waypaper";
          "on-click-right" = "changewall";
          "tooltip" = false;
        };
        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "active-only" = false;
          "all-outputs" = false;
          "warp-on-scroll" = false;
          "format" = "{icon}";
          "format-icons" = {
            "1" = "󰎤";
            "2" = "󰎧";
            "3" = "󰎪";
            "4" = "󰎭";
            "5" = "󰎱";
            "6" = "󰎳";
            "7" = "󰎶";
            "8" = "󰎹";
            "9" = "󰎼";
          };
        };
        "hyprland/window" = {
          "format" = "<span color='#222222' bgcolor='#d3869b' > WIN </span> {class}";
          "separate-outputs" = true;
        };
        "tray" = {
          "icon-size" = 15;
          "spacing" = 5;
        };
        "cpu" = {
          "format" = "<span color='#222222' bgcolor='#e78a4e'> CPU </span> {usage}%";
          "interval" = 20;
        };
        "network" = {
          "format" = "<span color='#222222' bgcolor='#b8bb26'> NET </span> {ifname}";
          "format-wifi" = "<span color='#222222' bgcolor='#b8bb26'> NET </span>  {ifname}";
          "format-ethernet" = "<span color='#222222' bgcolor='#b8bb26'> NET </span>  {ifname}";
          "on-click" = "${pkgs.lib.getExe pkgs.networkmanager_dmenu}";
          "tooltip" = false;
        };
        "temperature" = {
          "tooltip" = false;
          # "thermal-zone" = 2;
          "hwmon-path" = "/sys/class/hwmon/hwmon2/temp3_input";
          "critical-threshold" = 75;
          "format-critical" = "<span color='#222222' bgcolor='#cc241d' > TEM </span> {temperatureC}°C";
          "format" = "<span color='#222222' bgcolor='#d8a657' > TMP </span> {temperatureC}°C ";
        };
        "memory" = {
          "format" = "<span color='#222222' bgcolor='#458588'> MEM </span> {used}GiB";
          "interval" = 1;
          "tooltip" = false;
        };
        "pulseaudio" = {
          # "scroll-step": 1, # %, can be a float
          "format" = "<span color='#222222' bgcolor='#83a598'> VOL </span> {volume}%";
          "format-muted" = "<span color='#222222' bgcolor='#ea6962'> MUTE </span> {volume}%";
          "format-bluetooth" = "<span color='#222222' bgcolor='#83a598'> BLU </span> {volume}%";
          "format-bluetooth-muted" = "<span color='#222222' bgcolor='#ea6962'> MUTE </span> {volume}%";
          "format-source" = "{volume}% ";
          "on-click" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "on-click-right" = "pavucontrol";
          "tooltip" = false;
          "max-volume" = 130;
        };
        "clock" = {
          # "timezone" = "America/New_York";
          "format" = "<span color='#222222' bgcolor='#8ec07c'> TIME </span> {:%I:%M}";
          "format-alt" = "<span color='#222222' bgcolor='#8ec07c'> DATE </span> {:%b %d %Y}";
          "tooltip" = false;
          "interval" = 1;
        };
        "mpris" = {
          "max-length" = 100;
          "format" = "<span color='#222222' bgcolor='#ea6962'> MEDIA </span> {dynamic}";
          # "format-paused" = "{status_icon} {title}";
          # "format-stopped" = "<span foreground='#bb9af7'></span>";
          "dynamic-order" = [
            "title"
            "artist"
          ];
          "dynamic-seperator" = "-";
          "status_icons" = {
            "playing" = "▶";
            "paused" = "⏸";
          };
        };
      }
    ];
  };
}
