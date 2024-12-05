{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
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
          # "mpd"
        ];
        modules-right = [
          "tray"
          "cpu"
          "temperature"
          "memory"
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
        # "disk" = {
        #   "format" = "<span color='#222222' bgcolor='#ea6962' > DSK </span> {free}";
        #   "interval" = 20;
        # };
        "cpu" = {
          "format" = "<span color='#222222' bgcolor='#e78a4e'> CPU </span> {usage}%";
          "tooltip" = false;
          "interval" = 1;
        };
        "temperature" = {
          "tooltip" = false;
          "thermal-zone" = 2;
          "hwmon-path" = "/sys/class/hwmon/hwmon1/temp1_input";
          "critical-threshold" = 70;
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
        "mpd" = {
          "max-length" = 25;
          "format" = "<span foreground='#bb9af7'></span> {title}";
          "format-paused" = " {title}";
          "format-stopped" = "<span foreground='#bb9af7'></span>";
          "format-disconnected" = "";
          "on-click" = "mpc --quiet toggle";
          "on-click-right" = "mpc update; mpc ls | mpc add";
          "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp ";
          "on-scroll-up" = "mpc --quiet prev";
          "on-scroll-down" = "mpc --quiet next";
          "smooth-scrolling-threshold" = 5;
          "tooltip-format" = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
        };
      }
    ];
    style = ''
      /* ================================ */
      /*            Common CSS            */
      /* ================================ */
      * {
        /* `otf-font-awesome` is required to be installed for icons */
        padding: 0;
        border-radius: 0;
        min-height: 0;
        margin: 0;
        border: none;
        text-shadow: none;
        transition: none;
        box-shadow: none;
      }

      /* the whole window */
      window#waybar {
        background: #1d1d1d;
        color: #fff4d2;
        padding: 0;
        margin: 0;
      }

      window#waybar.hidden {
        opacity: 1;
      }

      /* Custom Icon */

      #custom-icon {
        padding-left: 8px;
        font-size: 22px;
        font-weight: 800;
      }

      /* ================================ */
      /*       workspaces module          */
      /* ================================ */
      #workspaces {
        margin: 0px;
      }

      #workspaces button {
        color: #fff4d2;
        padding: 0 4px;
        margin-bottom: 4px;
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 22px;
        font-weight: 800;
        border-bottom: 2px solid transparent;
      }

      #workspaces button:hover {
        color: #d3869b;
        background: none;
      }

      /* #workspaces button.visible {
        color: #8ec07c;
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 22px;
        font-weight: 800;
        border-radius: 0;
        padding: 0 4px;
        border-bottom: 2px solid #8ec07c;
      }

      #workspaces button.visible:hover {
        color: #8ec07c;
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 22px;
        font-weight: 800;
        border-radius: 0;
        padding: 0 4px;
      } */

      #workspaces button.active {
        color: #8ec07c;
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 22px;
        font-weight: 800;
        border-radius: 0;
        padding: 0 4px;
        border-bottom: 2px solid #8ec07c;
      }

      #workspaces button.active:hover {
        color: #8ec07c;
        font-family: IosevkaTerm Nerd Font Propo;
        font-size: 22px;
        font-weight: 800;
        border-radius: 0;
        padding: 0 4px;
      }

      #workspaces button.urgent {
        color: #ea6962;
        border-bottom: 2px solid #ea6962;
      }

      /* ================================ */
      /*            window                 */
      /* ================================ */

      #window {
        color: #d3869b;
        background: none;
        margin: 4px 8px;
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        border-bottom: 2px solid #d3869b;
      }

      /* ================================ */
      /*            tray                 */
      /* ================================ */

      #tray {
        margin: 0 3px;
        padding: 0 8px;
      }

      /* ================================ */
      /*            disk                 */
      /* ================================ */

      #disk {
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        color: #ea6962;
        margin: 5px 2px;
        border-bottom: 2px solid #ea6962;
      }

      /* ================================ */
      /*            cpu                  */
      /* ================================ */
      #cpu {
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        color: #e78a4e;
        margin: 5px 2px;
        border-bottom: 2px solid #e78a4e;
      }

      /* ================================ */
      /*            temp                  */
      /* ================================ */
      #temperature {
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        color: #d8a657;
        margin: 5px 3px;
        border-bottom: 2px solid #d8a657;
      }

      #temperature.critical {
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        color: #cc241d;
        margin: 5px 3px;
        border-bottom: 2px solid #cc241d;
      }

      /* ================================ */
      /*            memory                */
      /* ================================ */
      #memory {
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        color: #458588;
        margin: 5px 3px;
        border-bottom: 2px solid #458588;
      }

      /* ================================ */
      /*         pulseaudio               */
      /* ================================ */
      #pulseaudio {
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        color: #83a598;
        margin: 5px 3px;
        border-bottom: 2px solid #83a598;
      }

      #pulseaudio.muted {
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        color: #ea6962;
        margin: 5px 3px;
        border-bottom: 2px solid #ea6962;
      }

      /* ================================ */
      /*            battery               */
      /* ================================ */
      #battery {
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        color: #689d6a;
        margin: 5px 3px;
        border-bottom: 2px solid #689d6a;
      }

      #battery.critical {
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        color: #cc241d;
        margin: 5px 3px;
        border-bottom: 2px solid #cc241d;
      }

      #battery.warning {
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        color: #e78a4e;
        margin: 5px 3px;
        border-bottom: 2px solid #e78a4e;
      }
      /* ================================ */
      /*            clock                 */
      /* ================================ */
      #clock {
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        color: #8ec07c;
        margin: 5px 3px;
        border-bottom: 2px solid #8ec07c;
      }    '';
  };
}
