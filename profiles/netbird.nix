{
  services.netbird.enable = true;

  networking.firewall = {
    trustedInterfaces = [ "wt0" ];
  };
}
