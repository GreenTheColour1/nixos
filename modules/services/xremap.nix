{ delib, host, inputs, ... }:
delib.module {
  name = "services.xremap";

  options = delib.singleEnableOption host.isDesktop;

  home.always.imports = [ inputs.xremap-flake.homeManagerModules.default ];

  home.ifEnabled.services.xremap = {
    withWlroots = true;
    mouse = true;
    config = {
      modmap = [
        {
          name = "RuneLite";
          remap = {
            BTN_EXTRA = {
              held = "BTN_MIDDLE";
              alone = "BTN_EXTRA";
            };
          };
          application = {
            only = "/RuneLite/";
          };
        }
      ];
    };
  };
}
