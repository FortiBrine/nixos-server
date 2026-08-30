{ lib, ... }: {
  networking.useDHCP = false;
  networking.networkmanager.enable = true;
  networking.useNetworkd = lib.mkForce false;

  systemd.network.wait-online.enable = false;

  services.cloud-init = {
    enable = true;
    network.enable = true;
    settings = {
      system_info.network.renderers = [ "network-manager" ];
    };
  };
}
