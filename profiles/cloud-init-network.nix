{
  networking.useDHCP = false;
  networking.useNetworkd = true;

  services.cloud-init = {
    enable = true;
    network.enable = true;
  };
}
