{ delib, lib, ... }:
delib.extension {
  name = "preservation";
  description = "Central /persist merge for per-module preservation.ifEnabled (Option A)";

  # Extension settings (set via .withConfig { preserveAt = ...; } in flake.nix).
  config = {
    preserveAt = "/persist";
  };

  # Teach delib.module a new `preservation.{ifEnabled,ifDisabled,always}` target.
  # Each snippet is merged centrally into
  #   nixos.preservation.preserveAt."<myconfig.preservation.preserveAt>"
  # and therefore gated on the module's own `cfg.enable`, exactly like
  # `nixos.ifEnabled`. Always emits NixOS config, so user (`users.<name>`)
  # persistence declared next to `home.ifEnabled` still lands in the
  # (NixOS-only) preservation module.
  libExtension =
    extConfig: final: prev: {
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
            { ifEnabled ? { }, ifDisabled ? { }, always ? { } }:
            { inherit ifEnabled ifDisabled always; };

          _nixos = defaults nixos;
          _preservation = defaults preservation;

          # Merge one nixos slice with one preservation slice.
          # Both slices may be attrsets or lambdas receiving
          # { name, myconfig, cfg, parent, ... }.
          #
          # STRICTNESS CONTRACT (learned the hard way): this code must
          # never force the *values* of the evaluated nixos slice. Slices
          # routinely capture file-level `config` (e.g. boot's
          # `config.boot.kernelPackages`), and forcing such a thunk while
          # the module system is still merging `config` is an instant
          # infinite recursion. Hence:
          # - emptiness is tested with `attrNames` (names only, no values),
          #   never `==` on evaluated results;
          # - merging uses flat, lazy `//` (names only), never
          #   `recursiveUpdate` on nixos config and never nested `imports`
          #   (this nixpkgs rejects `mkIf cond { imports = ...; }`, which
          #   is what denix's enable-gating would wrap it in).
          # Cross-module list concatenation (e.g. `directories` from many
          # modules) is left to the NixOS option merger: every module
          # contributes its own `preservation.preserveAt."<path>"`.
          # Corner: don't mix direct `nixos.*.preservation.*` settings with
          # `preservation.ifEnabled` in one module — the latter wins
          # shallowly on collision.
          sliceEmpty = s: builtins.isAttrs s && builtins.attrNames s == [ ];

          mergeSlice =
            nixosSlice: preservationSlice: args:
            if sliceEmpty preservationSlice then
              # No preservation snippet: evaluate exactly like upstream
              # `wrap` would (must not return a lambda here: this value
              # lands directly in the module `imports`).
              (if builtins.isFunction nixosSlice then nixosSlice args else nixosSlice)
            else
              let
                preservationCfg =
                  if builtins.isFunction preservationSlice then
                    preservationSlice args
                  else
                    preservationSlice;
                preserveAtPath =
                  args.myconfig.preservation.preserveAt or extConfig.preserveAt;
                # The `preservation` option value contributed by this module.
                pPreservation = {
                  preserveAt.${preserveAtPath} = preservationCfg;
                };
                nixosCfg =
                  if builtins.isFunction nixosSlice then nixosSlice args else nixosSlice;
              in
              if builtins.isAttrs nixosCfg && !(nixosCfg ? _type) then
                nixosCfg
                // {
                  preservation = (nixosCfg.preservation or { }) // pPreservation;
                }
              else
                throw
                  "preservation.ifEnabled cannot be combined with a non-attrset nixos.* slice "
                  + "in denix module '${name}'. Use a plain attrset (or lambda returning one) for "
                  + "nixos.ifEnabled/ifDisabled/always in this module.";
        in
        prev.module {
          inherit name options myconfig home darwin;
          nixos = {
            ifEnabled = args: mergeSlice _nixos.ifEnabled _preservation.ifEnabled args;
            ifDisabled = args: mergeSlice _nixos.ifDisabled _preservation.ifDisabled args;
            always = args: mergeSlice _nixos.always _preservation.always args;
          };
        };
    };

  # Base `myconfig.preservation` module, auto-imported on every host.
  # Hosts opt in with `myconfig.preservation.enable = true;`.
  # The upstream preservation NixOS module is imported here (NixOS-only via
  # `nixos.always`, so `home` configurations are unaffected).
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
                  # Live perms are 0444; keep them.
                  { file = "/etc/machine-id"; inInitrd = true; mode = "0444"; }
                  "/etc/adjtime"
                ];
                directories = [
                  # inInitrd: uid/gid mappings are needed for early-boot
                  # ownership (matches upstream examples).
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

            # systemd-machine-id-commit.service would fail with a
            # bind-mounted machine-id; not relevant for this setup.
            # See preservation docs "Simple" example.
            systemd.suppressedSystemUnits = [ "systemd-machine-id-commit.service" ];

            # Intermediate parents of preserved user entries would
            # otherwise be created root-owned on fresh tmpfs (preservation
            # manages the entries themselves plus optionally their
            # immediate parents only), locking the user out of their own
            # ~/.local etc. Upstream-recommended skeleton, user-owned.
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
