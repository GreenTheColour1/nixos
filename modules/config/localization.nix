{ delib, host, ... }:
delib.module {
  name = "localization";

  options.localization = with delib; {
    enable = boolOption host.isDesktop;

    timeZone = strOption "America/Toronto";
    force24Hour = boolOption false;

    locale = strOption "en_US.UTF-8";
    installAllLocales = boolOption host.isDesktop;
  };

  nixos.ifEnabled =
    { cfg, ... }:
    {
      time.timeZone = cfg.timeZone;
      time.hardwareClockInLocalTime = true;
      environment.variables.TZ = cfg.timeZone;

      i18n = {
        defaultLocale = cfg.locale;

        # extraLocales =
        #   if cfg.installAllLocales then
        #     [ "all" ]
        #   else
        #     [
        #       "${cfg.locale}/UTF-8"
        #     ];
      };
    };
}
