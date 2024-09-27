{ pkgs, ... }:
{
  home.packages = with pkgs; [ wlogout ];

  programs.wlogout = {
    enable = true;
    layout = [{
      "label" = "logout";
      "action" = "loginctl terminate-user $USER";
      "keybind" = "l";
      }
      {
      "label" = "windows";
      "action" = "sudo grub-reboot 2 && systemctl reboot"; #this should reboot into windows assuming windows the second entry
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
    }];
  };
}
