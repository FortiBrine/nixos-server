{ lib, ... }: {
  imports = [
    ./disko.nix
    ./networking.nix
    ../../users/fortibrine.nix
    ../../profiles/netbird.nix
    ../../profiles/podman.nix
    ../../common/bundle.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.devices = lib.mkForce [ "/dev/vda" ];

  users.users.fortibrine.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ1cbhsiwj3UH6uhWggvYxgAISWgH18IjJu5DSamWJN0 fortibrine@opensuse"
  ];
  networking.hostName = "envious-violet-caribou";
  time.timeZone = "Europe/UTC";

  services.openssh.openFirewall = lib.mkForce false;

  boot.supportedFilesystems = [ "xfs" ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";

}
