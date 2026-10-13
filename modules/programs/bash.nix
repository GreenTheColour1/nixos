{ delib, ... }:
delib.module {
  name = "programs.bash";

  options = delib.singleEnableOption true;

  home.ifEnabled.programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  preservation.ifEnabled =
    { myconfig, ... }:
    {
      users.${myconfig.constants.username}.files = [
        {
          file = ".bash_history";
          mode = "0600";
        }
      ];
    };
}
