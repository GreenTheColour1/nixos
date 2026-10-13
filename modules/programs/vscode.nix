{
  delib,
  pkgs,
  host,
  inputs,
  ...
}:
let
  system = pkgs.stdenv.hostPlatform.system;
  marketplace = inputs.nix-vscode-extensions.extensions.${system}.vscode-marketplace;
in
delib.module {
  name = "programs.vscode";

  options = delib.singleEnableOption host.guiFeatured;

  # nixos.always.nixpkgs.overlays = [ inputs.nix-vscode-extensions.overlays.default ];

  home.ifEnabled = {
    programs.vscode = {
      enable = true;
      mutableExtensionsDir = true;
      profiles.default.extensions = with marketplace; [
        # Python
        ms-python.python
        # ms-python.vscode-pylance
        ms-python.debugpy

        # Nix
        jnoortheen.nix-ide
        # mkhl.direnv
        arrterian.nix-env-selector

        # Go
        golang.go

        # Rust
        rust-lang.rust-analyzer

        # Debuggers
        # pkgs.vscode-marketplace-universal.vadimcn.vscode-lldb

        # Utilities
        vscodevim.vim
        esbenp.prettier-vscode
        shd101wyy.markdown-preview-enhanced
        streetsidesoftware.code-spell-checker

        # Look and feel
        jdinhlife.gruvbox
      ];
    };
  };

  # mutableExtensionsDir drift + profiles/sync state.
  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        # Live perms are 0700 (auth tokens in storage).
        {
          directory = ".config/Code";
          mode = "0700";
        }
        ".vscode"
      ];
    };
}
