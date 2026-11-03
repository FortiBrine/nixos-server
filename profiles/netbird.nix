{
  services.netbird.enable = true;

  networking.firewall = {
    interfaces."wt0" = {
      allowedTCPPorts = [ 2222 ];
    };
  };
}
