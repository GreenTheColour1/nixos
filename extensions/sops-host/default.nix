{ delib, ... }:
delib.extension {
  name = "sops-host";
  description = "Per-host secretsFile for sops-nix (shared secrets.yaml + hosts/<name>/secrets.yaml)";

  libExtension = _: _: prev: {
    hostSubmoduleOptions = prev.hostSubmoduleOptions // {
      secretsFile = delib.noDefault (delib.pathOption null);
    };
  };

  modules = [
    (
      { delib, host, lib, ... }:
      delib.module {
        name = "sops-host";

        options.sops = with delib; {
          hostSecrets = attrsOption { };
        };

        nixos.always =
          { myconfig, ... }:
          {
            assertions = [
              {
                assertion = myconfig.sops.hostSecrets == { } || host.secretsFile != null;
                message = "Host '${host.name}' defines myconfig.sops.hostSecrets but no `secretsFile`. Set `secretsFile = ./secrets.yaml;` in hosts/${host.name}/default.nix.";
              }
            ];

            sops.secrets = lib.mapAttrs (
              _: secret: { sopsFile = lib.mkDefault host.secretsFile; } // secret
            ) myconfig.sops.hostSecrets;
          };
      }
    )
  ];
}
