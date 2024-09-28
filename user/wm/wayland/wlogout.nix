{
  pkgs,
  userSettings,
  config,
  ...
}:
{
  home.packages = with pkgs; [ wlogout ];

  programs.wlogout = {
    enable = true;
    layout = [
      {
        "label" = "logout";
        "action" = "loginctl terminate-user $USER";
        "keybind" = "l";
      }
      {
        "label" = "windows";
        "action" = "sudo grub-reboot 2 && systemctl reboot"; # this should reboot into windows assuming windows the second entry
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
          font-family: '${userSettings.font}', sans-serif;
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
          background-image: image(url("${./icons/logout-svgrepo-com.svg}"));
          background-color: #${config.lib.stylix.colors.base08};
          border-radius: 5px 0px 0px 0px;
          margin: 100px 0px 0px 550px;
      }
      #logout:hover {
          border-radius: 10px 10px 0px 10px;
          margin : 80px 0px 0px 530px;
      }

      #windows {
          background-image: image(url("${./icons/windows-svgrepo-com.svg}"));
          background-color: #${config.lib.stylix.colors.base09};
          border-radius: 0px 0px 0px 5px;
          margin: 0px 0px 100px 550px;
      }
      #windows:hover {
          border-radius: 10px 0px 10px 10px;
          margin : 0px 0px 80px 530px;
      }

      #shutdown {
          background-image: image(url("${./icons/poweroff-svgrepo-com.svg}"));
          background-color: #${config.lib.stylix.colors.base0A};
          border-radius: 0px 5px 0px 0px;
          margin: 100px 550px 0px 0px;
      }
      #shutdown:hover{
          border-radius: 10px 10px 10px 0px;
          margin : 80px 530px 0px 0px;
      }

      #reboot {
          background-image: image(url("${./icons/restart-svgrepo-com.svg}"));
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
}
