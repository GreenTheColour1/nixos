{ ... }:
{
  programs.nixvim.plugins.mini = {
    enable = true;
    modules = {
      ai = {
        n_lines = 500;
      };
      surround = {
        mappings = {
          add = "sa"; 
          delete = "sd"; 
          find = "sf"; 
          find_left = "sF"; 
          highlight = "sh"; 
          replace = "sr"; 
          update_n_lines = "sn"; 

          suffix_last = "l"; 
          suffix_next = "n"; 
        };
      };
    };
  };
}
