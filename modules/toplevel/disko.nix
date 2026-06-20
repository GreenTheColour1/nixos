{
  delib,
  inputs,
  ...
}:
delib.module {
  name = "disko";

  options.disko = with delib; {
    enable = boolOption false;
    devices = attrsOption { };
  };

  nixos.always.imports = [ inputs.disko.nixosModules.disko ];

  nixos.ifEnabled = { cfg, ... }: {
    disko.devices = cfg.devices;
  };
}
