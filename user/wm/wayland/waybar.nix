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
          # "custom/cava-internal"
        ];
        modules-center = [
          "mpd"
        ];
        modules-right = [
          "pulseaudio"
          "backlight"
          "memory"
          "cpu"
          "network"
          "tray"
          "clock"
        ];
        "custom/icon" = {
          "format" = " ";
          "on-click" = "waypaper";
          "on-click-right" = "changewall";
          "tooltip" = false;
        };
        # "custom/cava-internal" = {
        #   "exec" = "sleep 1s && cava-internal";
        #   "tooltip" = false;
        # };
        "pulseaudio" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰖁 Muted";
          "format-icons" = {
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pamixer -t";
          "on-click-middle" = "pavucontrol";
          "tooltip" = false;
        };
        "clock" = {
          "interval" = 1;
          "format" = "{:%A %b %d %I:%M %p}";
        };
        "memory" = {
          "interval" = 1;
          "format" = "󰻠 {percentage}%";
          "states" = {
            "warning" = 85;
          };
        };
        "cpu" = {
          "interval" = 1;
          "format" = "󰍛 {usage}%";
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
        "network" = {
          "format-disconnected" = "󰯡 ";
          "format-ethernet" = "󰒢 ";
          "format-linked" = "󰖪 ";
          "format-wifi" = "󰖩 ";
          "interval" = 1;
          "tooltip" = false;
        };
        "tray" = {
          "icon-size" = 15;
          "spacing" = 5;
        };
      }
    ];
    style = ''
          * {
              font-family: "JetBrainsMono Nerd Font";
              font-size: 11pt;
              font-weight: bold;
              border-radius: 8px;
              transition-property: background-color;
              transition-duration: 0.5s;
            }
            @keyframes blink_red {
              to {
                background-color: rgb(242, 143, 173);
                color: rgb(26, 24, 38);
              }
            }
            .warning, .critical, .urgent {
              animation-name: blink_red;
              animation-duration: 1s;
              animation-timing-function: linear;
              animation-iteration-count: infinite;
              animation-direction: alternate;
            }
            window#waybar {
              background-color: transparent;
            }
            window > box {
              margin-left: 5px;
              margin-right: 5px;
              margin-top: 5px;
              background-color: #${config.lib.stylix.colors.base00};
              padding: 3px;
              padding-left:5px;
              border: 2px none #33ccff;
            }
      #workspaces {
              padding-left: 0px;
              padding-right: 4px;
            }
      #workspaces button {
              padding-top: 3px;
              padding-bottom: 3px;
              padding-left: 6px;
              padding-right: 6px;
            }
      #workspaces button.active {
              background-color: #${config.lib.stylix.colors.base04};
              color: rgb(26, 24, 38);
            }
      #workspaces button.urgent {
              color: rgb(26, 24, 38);
            }
      #workspaces button:hover {
              background-color: rgb(248, 189, 150);
              color: rgb(26, 24, 38);
            }
            tooltip {
              background: rgb(48, 45, 65);
            }
            tooltip label {
              color: rgb(217, 224, 238);
            }
      #custom-icon {
              font-size: 20px;
              padding-left: 8px;
              padding-right: 6px;
              color: #${config.lib.stylix.colors.base09};
            }
      #mode, #clock, #memory, #temperature,#cpu,#mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery, #custom-powermenu, #custom-cava-internal {
              padding-left: 10px;
              padding-right: 10px;
            }
            /* #mode { */
            /* 	margin-left: 10px; */
            /* 	background-color: rgb(248, 189, 150); */
            /*     color: rgb(26, 24, 38); */
            /* } */
      #memory {
              color: #${config.lib.stylix.colors.base08};
            }
      #cpu {
              color: #${config.lib.stylix.colors.base0A};
            }
      #clock {
              color: #${config.lib.stylix.colors.base07};
            }
      #custom-wall {
              color: #33ccff;
         }
      #pulseaudio {
              color: rgb(245, 224, 220);
            }
      #network {
              color: #${config.lib.stylix.colors.base0B};
            }
      #network.disconnected {
              color: #${config.lib.stylix.colors.base0B};
            }
      #tray {
              padding-right: 8px;
              padding-left: 8px;
            }
      #mpd.paused {
              color: #414868;
              font-style: italic;
            }
      #mpd.stopped {
              background: transparent;
            }
      #mpd {
              color: #c0caf5;
            }
    '';
  };
}
