{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "programs.fzf";

  options = delib.singleEnableOption host.cliFeatured;

  home.ifEnabled.programs.fzf = {
    enable = true;
    enableZshIntegration = true;

  };
}
