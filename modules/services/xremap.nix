{
  delib,
  host,
  inputs,
  ...
}:
delib.module {
  name = "services.xremap";

  options = delib.singleEnableOption host.gamingFeatured;

  home.always.imports = [ inputs.xremap-flake.homeManagerModules.default ];

  home.ifEnabled = {
    services.xremap = {
      enable = true;
      withHypr = true;
      mouse = true;
      config = {
        modmap = [
          {
            name = "RuneLite";
            remap = {
              BTN_EXTRA = "BTN_MIDDLE";
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
