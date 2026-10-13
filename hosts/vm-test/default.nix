{ delib, lib, ... }:
delib.host {
  name = "vm-test";

  rice = "gruvbox-dark-medium";
  type = "desktop";

  features = [
    "wireless"
  ];

  myconfig = {
    # Purpose-built impermanence test host: boots the real config with
    # disko's tmpfs / + /persist layout and preservation active.
    # device defaults to /dev/vda (QEMU's first disk) — see disko module.
    disko.enable = true;
    preservation.enable = true;

    # Headless-VM access: SSH daemon + first-boot console autologin.
    programs.ssh.enableOpenssh = true;
    services.getty.enable = true;
  };

  nixos = {
    # Build host's sops age key, shared read-only into the VM so the
    # VM decrypts exactly like bare metal (password login, gh key, ...).
    # Without this, /home/fishy is fresh tmpfs and the default keyFile
    # path does not exist in the guest.
    sops.age.keyFile = lib.mkForce "/mnt/age-key/keys.txt";
  };
}
