{
  delib,
  host,
  pkgs,
  inputs,
  ...
}:
delib.module {
  name = "services.sddm";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled =
    { myconfig, ... }:
    let
      # sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
      #   theme = "default";
      # };
    in
    {
      # environment.systemPackages = [ sddm-theme ];
      qt.enable = true;
      services.displayManager = {
        sddm = {
          enable = true;
          package = pkgs.kdePackages.sddm;
          wayland.enable = true;
          # theme = sddm-theme.pname;
          # extraPackages = sddm-theme.propagatedBuildInputs;
          # settings = {
          #   # required for styling the virtual keyboard
          #   General = {
          #     GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
          #     InputMethod = "qtvirtualkeyboard";
          #   };
          # };
        };
        autoLogin.enable = true;
        autoLogin.user = myconfig.constants.username;
      };
    };
}
