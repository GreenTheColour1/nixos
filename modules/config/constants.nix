{ delib, ... }:
delib.module {
  name = "constants";

  options.constants = with delib; {
    username = readOnly (strOption "GreenTheColour1");
    userfullname = readOnly (strOption "Cameron Green");
    useremail = readOnly (strOption "contact@camerongreen.ca");
  };
}
