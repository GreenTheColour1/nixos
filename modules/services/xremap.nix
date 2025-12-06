{
  delib,
  host,
  inputs,
  ...
}:
delib.module {
  name = "services.xremap";

  options = delib.singleEnableOption host.gamingFeatured;

  home.ifEnabled = {
    imports = [ inputs.xremap-flake.homeManagerModules.default ];
    services.xremap = {
      enable = true;
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
  };
}
