{
  pkgs,
  ...
}:
{
  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
    extensions = with pkgs.vscode-marketplace; [
      # Python
      ms-python.python
      ms-python.vscode-pylance

      # Nix
      jnoortheen.nix-ide
      mkhl.direnv
      arrterian.nix-env-selector

    ];
  };
}
