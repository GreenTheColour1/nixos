{ pkgs, userSettings, ... }:
{
  home.packages = [ pkgs.nixfmt-rfc-style ];

  programs.nixvim.plugins.lsp = {
    enable = true;

    servers = {
      # nil_ls = {
      #   enable = true;
      #   settings = {
      #     formatting = {
      #       command = [ "nixfmt" ];
      #     };
      #   };
      # };
      nixd = {
        enable = true;
        settings = {
          nixpkgs.expr = "import <nixpkgs> {}";
          formatting = {
            command = [ "nixfmt" ];
          };
          options = {
            nixos = {
              expr = ''
                let configs = (builtins.getFlake ("git+file://" + builtins.toString ./.)).nixosConfigurations; in (builtins.head (builtins.attrValues configs)).options
              '';
            };
            home_manager = {
              expr = ''
                let configs = (builtins.getFlake ("git+file://" + builtins.toString ./.)).homeConfigurations; in (builtins.head (builtins.attrValues configs)).options
              '';
            };
          };
        };
      };
      lua_ls = {
        enable = true;
      };
    };
  };
}
