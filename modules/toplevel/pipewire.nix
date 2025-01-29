{ delib, ... }:
delib.module {
  name = "pipewire";

  options = delib.singleEnableOption true;

  nixos.ifEnabled = {
    # Pipewire
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };
}
