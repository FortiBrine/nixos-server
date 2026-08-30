{
  imports = [
    ../../users/fortibrine.nix
    ../../profiles/dhcp.nix
    ../../profiles/tailscale.nix
    ../../common/bundle.nix
  ];

  boot.growPartition = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.timeout = 0;

  users.users.fortibrine.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH0YU4hRk8CoImqmTClWknO2lrYXjWcT6YgxuAw8z9I0"
  ];
  networking.hostName = "oracle-server1";

  networking.firewall.allowedTCPPorts = [ 2222 ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";

}
