{
  delib,
  pkgs,
  host,
  inputs,
  ...
}:
delib.module {
  name = "programs.vscode";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.always.nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

  home.ifEnabled = {
    programs.vscode = {
      enable = true;
      mutableExtensionsDir = true;
      profiles.default.extensions = with pkgs.vscode-marketplace; [
        # Python
        ms-python.python
        ms-python.vscode-pylance

        # Nix
        # jnoortheen.nix-ide
        # mkhl.direnv
        # arrterian.nix-env-selector
      ];
    };
  };
}
