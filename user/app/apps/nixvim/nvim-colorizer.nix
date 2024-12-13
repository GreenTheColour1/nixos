{ ... }:
{
  programs.nixvim.plugins.colorizer = {
    enable = true;
    settings.user_default_options = {
      RGB = true;
      RRGGBB = true;
      RRGGBBAA = true;
      rgb_fn = true;
      hsl_fn = true;
      css = true;
      css_fn = true;
      mode = "background";
    };
  };
}
