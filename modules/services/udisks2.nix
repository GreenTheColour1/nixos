{
  delib,
  host,
  lib,
  ...
}:
delib.module {
  name = "services.udisks2";

  options = delib.singleEnableOption host.guiFeatured;

  nixos.ifEnabled = {
    services.udisks2 = {
      enable = true;
    };
  };

  home.ifEnabled =
    { myconfig, ... }:
    {
      services.udiskie = {
        enable = true;
        settings = {
          program_options = {
            file_manager = "${lib.getExe myconfig.programs.file-browser.defaultFileBrowserPackage}";
          };
        };
      };
    };
}
