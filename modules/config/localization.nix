{ delib, host, ... }:
delib.module {
  name = "localization";

  options.localization = with delib; {
    enable = boolOption host.isDesktop;

    timeZone = strOption "America/Toronto";
    force24Hour = boolOption false;

    local = strOption "en_US.UTF-8";
    installAllLocales = boolOption host.isDesktop;
  };

  nixos.ifEnabled = { cfg, ... }: {
    time.timeZone = cfg.local;
    environment.variables.TZ = cfg.timeZone;

    i18n = {
      defaultLocal = cfg.local;

      supportedLocales = 
        if cfg.installAllLocales
        then [ "all" ]
        else [
          "${cfg.local}/UTF-8"
        ];
    };
  };
}
