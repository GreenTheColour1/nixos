{ pkgs, ... }:
let
  my-comfyui = pkgs.comfyuiPackages.comfyui.override {
    commandLineArgs = [
      "--preview-method"
      "auto"
    ];
  };
in
{
  home.packages = [ my-comfyui ];
}
