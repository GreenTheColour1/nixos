{ delib, ... }:
delib.module {
  name = "rices";

  options =
    with delib;
    let
      rice = {
        options = riceSubmoduleOptions;
      };
    in
    {
      rice = riceOption rice;
      rices = riceOption rice;
    };

  home.always =
    { myconfig, ... }:
    {
      assertions = delib.riceNamesAssertions myconfig.rices;
    };
}
