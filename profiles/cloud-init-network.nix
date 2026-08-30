{
  networking.useDHCP = false;
  networking.useNetworkd = true;

  services.cloud-init = {
    enable = true;
    network.enable = true;
  };

  environment.etc."systemd/network/10-cloud-init-eth0.network.d/gateway-onlink.conf".text = ''
    [Route]
    Gateway=10.0.0.1
    GatewayOnLink=yes

    [Route]
    Gateway=fd00::1
    GatewayOnLink=yes
  '';
}
