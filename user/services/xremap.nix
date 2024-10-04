{ inputs, userSettings, ... }:
{
  imports = [ inputs.xremap-flake.homeManagerModules.default ];

  services.xremap = {
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
        }
      ];
    };
  };
}
