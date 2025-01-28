{ delib, ... }:
delib.module {
  name = "programs.nixvim.plugins.oil";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.nixvim.plugins.oil = {
    enable = true;
    settings = {
      view_options = {
        show_hidden = true;
      };
    };
    luaConfig.post = ''
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    '';
  };
}
