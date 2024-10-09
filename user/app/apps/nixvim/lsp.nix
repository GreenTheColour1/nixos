{ pkgs, ... }:
{
  home.packages = [ pkgs.nixfmt-rfc-style ];

  programs.nixvim.plugins.lsp = {
    enable = true;

    servers = {
      nil_ls = {
        enable = true;
        settings = {
          formatting = {
            command = [ "nixfmt" ];
          };
        };
      };
      lua_ls = {
        enable = true;
      };
    };
  };
}
