{ delib, host, ... }:
delib.module {
  name = "udev";

  options = delib.singleEnableOption host.isDesktop;

  # Rule for disabling autosuspend on my webcam
  nixos.ifEnabled.services.udev.extraRules =
    "ACTION==\"add\", SUBSYSTEM==\"usb\", ATTR{idVendor}==\"046d\", ATTR{idProduct}==\"0825\", ATTR{power/control}=\"on\"";
}
