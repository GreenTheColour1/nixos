{
  delib,
  host,
  pkgs,
  config,
  ...
}:
delib.module {
  name = "programs.wlogout";

  options = delib.singleEnableOption host.guiFeatured;

  home.ifEnabled = {
    home.packages = [ pkgs.wlogout ];

    programs.wlogout = {
      enable = true;
      layout = [
        {
          "label" = "logout";
          "action" = "uwsm stop";
          "keybind" = "l";
        }
        {
          "label" = "windows";
          "action" = "systemctl reboot --boot-loader-entry=auto-windows";
          "keybind" = "w";
        }
        {
          "label" = "shutdown";
          "action" = "systemctl poweroff";
          "keybind" = "s";
        }
        {
          "label" = "reboot";
          "action" = "systemctl reboot";
          "keybind" = "r";
        }
      ];

      style = ''
        /* general */ 
        * {
            transition: 20ms;
            box-shadow: none;
        }

        window {
            color: #${config.lib.stylix.colors.base07};
            background-color: rgba(45, 53, 59, 0.7);
            font-family: FiraCode Nerd Font, sans-serif;
            font-weight: bold;
            font-size: 20px;
        }

        button {
            color: #FFFFFF;
            background-color: #${config.lib.stylix.colors.base01};
            background-position: center;
            background-repeat: no-repeat;
            background-size: 20%;
            border: none;
            border-radius: 10px;
            outline-style: none;
        }
        button:hover {
            background-size: 25%;
        }

        #logout {
            background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"))
            background-color: #${config.lib.stylix.colors.base08};
            border-radius: 5px 0px 0px 0px;
            margin: 100px 0px 0px 550px;
        }
        #logout:hover {
            border-radius: 10px 10px 0px 10px;
            margin : 80px 0px 0px 530px;
        }

        #windows {
            background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"))
            background-color: #${config.lib.stylix.colors.base09};
            border-radius: 0px 0px 0px 5px;
            margin: 0px 0px 100px 550px;
        }
        #windows:hover {
            border-radius: 10px 0px 10px 10px;
            margin : 0px 0px 80px 530px;
        }

        #shutdown {
            background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"))
            background-color: #${config.lib.stylix.colors.base0A};
            border-radius: 0px 5px 0px 0px;
            margin: 100px 550px 0px 0px;
        }
        #shutdown:hover{
            border-radius: 10px 10px 10px 0px;
            margin : 80px 530px 0px 0px;
        }

        #reboot {
            background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"))
            background-color: #${config.lib.stylix.colors.base0B};
            border-radius: 0px 0px 5px 0px;
            margin: 0px 550px 100px 0px;
        }
        #reboot:hover {
            border-radius: 0px 10px 10px 10px;
            margin: 0px 530px 80px 0px;
        }
      '';
    };
  };
}
