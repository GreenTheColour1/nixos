{ delib, ... }:
delib.host {
  name = "nixos-fishy";

  myconfig.bluetooth.enable = true;
}
