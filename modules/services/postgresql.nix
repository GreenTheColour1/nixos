{
  delib,
  host,
  pkgs,
  ...
}:
delib.module {
  name = "services.postgresql";

  options.services.postgresql = with delib; {
    enable = boolOption false;

  };
}
