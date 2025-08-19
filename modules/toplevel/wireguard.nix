{
  delib,
  host,
  pkgs,
  config,
  ...
}:
delib.module {
  name = "wireguard";

  options = delib.singleEnableOption false;

  nixos.ifEnabled = {
    sops.templates."wg-laptop.conf".content = config.sops.placeholder.wg_laptop;

    environment.systemPackages = with pkgs; [
      wireguard-tools
      (writeShellScriptBin "wg-connect" ''
        sudo wg-quick up ${config.sops.templates."wg-laptop.conf".path}
      '')
      (writeShellScriptBin "wg-disconnect" ''
        sudo wg-quick down ${config.sops.templates."wg-laptop.conf".path}
      '')
    ];
  };
}
