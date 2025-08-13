{ delib, ... }:
delib.module {
  name = "nvidia-prime";

  options = delib.singleEnableOption false;

  nixos.ifEnabled = {
    hardware.nvidia.prime = {
      offload.enable = true;
      offlaod.enableOffloadCmd = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
