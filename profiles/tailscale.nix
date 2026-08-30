{
  services.tailscale = {
    enable = true;
    extraDaemonFlags = [ "--no-logs-no-support" ];
  };

  networking.firewall = {
    trustedInterfaces = [ "tailscale0" ];
  }
}
