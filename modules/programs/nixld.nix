{
  delib,
  inputs,
  host,
  ...
}:
delib.module {
  name = "programs.nixld";

  options = delib.singleEnableOption host.cliFeatured;

  nixos.always.imports = [ inputs.nix-ld.nixosModules.nix-ld ];

  nixos.ifEnabled = {
    programs.nix-ld.dev = {
      enable = true;
    };
  };
}
