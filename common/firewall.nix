{
  networking.firewall = {
    enable = true;
    trustedInterfaces = [ "tailscale0" ];

    allowedTCPPorts = [ 2222 ];
    allowedUDPPorts = [ ];
  };
}
