{ pkgs, ... }:
{
  home.packages = [ pkgs.nixfmt-rfc-style ];

  programs.nixvim.plugins.lsp = {
    enable = true;

    servers = {
      nil-ls = {
        enable = true;
        settings = {
          formatting = {
            command = [ "nixfmt" ];
          };
        };
      };
      lua-ls = {
        enable = true;
      };
    };
  };
}
