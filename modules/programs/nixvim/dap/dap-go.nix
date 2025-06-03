{ delib, pkgs, ... }:
delib.module {
  name = "programs.nixvim.dap.dap-go";

  options = delib.singleEnableOption true;

  home.ifEnabled = {
    programs.nixvim = {
      plugins.dap-go = {
        enable = true;
        settings.delve.path = "${pkgs.delve}/bin/dlv";
        settings.delve.args = [
          "--log"
          "--log-output=dap,rpc,debugger"
          "--log-dest=/tmp/dlv.log"
        ];
      };
    };
  };
}
