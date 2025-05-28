{ delib, host, ... }:
delib.module {
  name = "cpupower";

  options = delib.singleEnableOption host.isDesktop;

  nixos.ifEnabled = {
    powerManagment.cpuFreqGovernor = "preformance";
  };
}
