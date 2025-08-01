{ delib, ... }:
delib.module {
  name = "constants";

  options.constants = with delib; {
    username = readOnly (strOption "fishy");
    gituser = readOnly (strOption "GreenTheColour1");
    userfullname = readOnly (strOption "Cameron Green");
    useremail = readOnly (strOption "contact@camerongreen.ca");
  };

  myconfig.always =
    { cfg, ... }:
    {
      args.shared.constants = cfg;
    };
}
