{
  delib,
  inputs,
  host,
  ...
}:
delib.module {
  name = "programs.hypr-exiled";

  options = delib.singleEnableOption false;

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.directories = [
        ".config/hypr-exiled"
        ".local/share/hypr-exiled"
      ];
    };

}
