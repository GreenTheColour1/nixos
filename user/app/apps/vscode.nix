{
  pkgs,
  inputs,
  systemSettings,
  ...
}:
let
  vscode-exts = inputs.nix-vscode-extensions.extensions.vscode-marketplace;
in
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    extentions = with vscode-exts; [
      ms-python.python
      ms-python.vscode-pylance
    ];
  };
}
