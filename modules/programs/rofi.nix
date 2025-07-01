{
  delib,
  host,
  pkgs,
  lib,
  ...
}:
delib.module {
  name = "programs.rofi";

  options = delib.singleEnableOption host.isDesktop;

  home.ifEnabled =
    { myconfig, ... }:
    {
      programs.rofi = {
        enable = true;
        package = pkgs.rofi-wayland;
        extraConfig = {
          modi = "drun";
          columns = 1;
          lines = 5;
          show-icons = true;
          terminal = "kitty";
          drun-display-format = "{icon} {name}";
          seperator-style = "style";
          matching = "fuzzy";
        };
      };
      home.packages = lib.mkIf myconfig.programs.tmux.enable [
        (pkgs.writeShellScriptBin "startdevshell" ''
          #Find all directories in ~/Projects
          PROJECT_DIR=~/Projects
          DIRS=$(find "$PROJECT_DIR" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;)

          #Send the list of directories to rofi
          SELECTED=$(echo "$DIRS" | rofi -dmenu -p "Select project")

          # If no selection is made, exit
          [ -z "$SELECTED" ] && exit 1

          #Check for devenv.nix or flake.nix
          TARGET="$PROJECT_DIR/$SELECTED"
          cd "$TARGET" || exit 1

          if [ -f "$TARGET/devenv.nix" ]; then
              kitty --working-directory="$TARGET" -e devenv shell
          elif [ -f "$TARGET/flake.nix" ]; then
              kitty --working-directory="$TARGET" -e nix develop
          else
              echo "No devenv.nix or flake.nix found in $TARGET" | rofi -e -
              exit 1
          fi
        '')
      ];
    };
}
