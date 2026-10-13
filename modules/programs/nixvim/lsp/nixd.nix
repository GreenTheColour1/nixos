{
  delib,
  pkgs,
  lib,
  host,

  ...
}:
let
  flake = ''(builtins.getFlake "/home/fishy/nix-config")'';
in
delib.module {
  name = "programs.nixvim.lsp.nixd";

  options = delib.singleEnableOption true;

  home.ifEnabled =
    { myconfig, ... }:
    {
      programs.nixvim.plugins.lsp.servers.nixd = {
        enable = true;
        settings = {
          formatting.command = [ "${lib.getExe pkgs.nixfmt}" ];

          options = {
            nixos.expr = "${flake}.nixosConfigurations.${host.name}.options";
            # home-manager.expr = "${flake}.homeConfigurations.\"fishy@${host.name}\".options";
            # myconfig.expr = "${flake}.nixosConfigurations.${host.name}.options.myconfig";
          };
        };
      };
    };
}
