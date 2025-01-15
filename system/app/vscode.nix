{
  pkgs,
  inputs,
  systemSettings,
  ...
}:
let
  extentions = inputs.nix-vscode-extentions.extentions.${systemSettings.system};
in
{
  environment.systemPackages = with pkgs; [
    vscode-with-extensions.override
    {
      vscodeExtentions = [
        extentions.vscode-marketplace.python.python
      ];
    }
  ];
}