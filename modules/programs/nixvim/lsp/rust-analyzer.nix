{ delib, ... }:
delib.module {
  name = "programs.nixvim.lsp.rust-analyzer";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.lsp.servers.rust_analyzer = {
    enable = true;

    installCargo = true;
    installRustc = true;
  };
}
