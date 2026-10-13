{ delib, lib, ... }:
delib.extension {
  name = "preservation";
  description = "Central /persist merge for per-module preservation.ifEnabled (Option A)";

  config = {
    preserveAt = "/persist";
  };

  libExtension = extConfig: final: prev: {
    module =
      {
        name,
        options ? { },
        myconfig ? { },
        nixos ? { },
        home ? { },
        darwin ? { },
        preservation ? { },
        ...
      }:
      let
        defaults =
          {
            ifEnabled ? { },
            ifDisabled ? { },
            always ? { },
          }:
          {
            inherit ifEnabled ifDisabled always;
          };

        _nixos = defaults nixos;
        _preservation = defaults preservation;

        sliceEmpty = s: builtins.isAttrs s && builtins.attrNames s == [ ];

        mergeSlice =
          nixosSlice: preservationSlice: args:
          if sliceEmpty preservationSlice then
            (if builtins.isFunction nixosSlice then nixosSlice args else nixosSlice)
          else
            let
              preservationCfg =
                if builtins.isFunction preservationSlice then preservationSlice args else preservationSlice;
              preserveAtPath = args.myconfig.preservation.preserveAt or extConfig.preserveAt;
              pPreservation = {
                preserveAt.${preserveAtPath} = preservationCfg;
              };
              nixosCfg = if builtins.isFunction nixosSlice then nixosSlice args else nixosSlice;
            in
            if builtins.isAttrs nixosCfg && !(nixosCfg ? _type) then
              nixosCfg
              // {
                preservation = (nixosCfg.preservation or { }) // pPreservation;
              }
            else
              throw "preservation.ifEnabled cannot be combined with a non-attrset nixos.* slice "
              + "in denix module '${name}'. Use a plain attrset (or lambda returning one) for "
              + "nixos.ifEnabled/ifDisabled/always in this module.";
      in
      prev.module {
        inherit
          name
          options
          myconfig
          home
          darwin
          ;
        nixos = {
          ifEnabled = args: mergeSlice _nixos.ifEnabled _preservation.ifEnabled args;
          ifDisabled = args: mergeSlice _nixos.ifDisabled _preservation.ifDisabled args;
          always = args: mergeSlice _nixos.always _preservation.always args;
        };
      };
  };

  modules = extConfig: [
    (
      { delib, inputs, ... }:
      delib.module {
        name = "preservation";

        options.preservation = with delib; {
          enable = boolOption false;
          preserveAt = strOption extConfig.preserveAt;
        };

        nixos.always.imports = [ inputs.preservation.nixosModules.default ];

        nixos.ifEnabled =
          { myconfig, ... }:
          let
            inherit (myconfig.constants) username;
            home = "/home/${username}";
            skeletonDir = {
              user = username;
              group = "users";
              mode = "0755";
            };
          in
          {
            preservation = {
              enable = true;
              preserveAt.${myconfig.preservation.preserveAt} = {
                files = [
                  {
                    file = "/etc/machine-id";
                    inInitrd = true;
                    mode = "0444";
                  }
                ];
                directories = [
                  {
                    directory = "/var/lib/nixos";
                    inInitrd = true;
                  }
                  "/etc/nixos"
                  "/var/log"
                  "/var/lib/systemd/timers"
                  "/var/lib/systemd/coredump"
                ];
              };
            };

            systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];

            systemd.tmpfiles.settings.preservation = {
              "${home}/.config".d = skeletonDir;
              "${home}/.local".d = skeletonDir;
              "${home}/.local/share".d = skeletonDir;
              "${home}/.local/state".d = skeletonDir;
              "${home}/.var".d = skeletonDir;
            };
          };
      }
    )
  ];
}
