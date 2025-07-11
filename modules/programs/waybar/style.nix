{ delib, ... }:
delib.module {
  name = "programs.waybar";

  home.ifEnabled.programs.waybar = {
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
      /*            MPRIS                 */
      /* ================================ */

      #mpris {
        color: #ea6962;
        background: none;
        margin: 4px 8px;
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        border-bottom: 2px solid #ea6962;
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
      }
      /* ================================ */
      /*            Network               */
      /* ================================ */
      #network {
        font-family: IosevkaTerm Nerd Font Mono;
        font-size: 15px;
        font-weight: 800;
        color: #b8bb26;
        margin: 5px 3px;
        border-bottom: 2px solid #b8bb26;
      }    '';
  };
}
