{ ... }:
{
  age.secrets.network-addresses = {
    file = ../../secrets/mexican-pearl18408/network-addresses.age;
    mode = "0444";
    path = "/etc/systemd/network/10-eth0.network.d/50-addresses.conf";
  };

  networking.useDHCP = false;
  networking.useNetworkd = true;

  services.cloud-init.enable = false;
  services.cloud-init.network.enable = false;

  systemd.network.networks."10-eth0" = {
    matchConfig.MACAddress = "52:54:00:cc:b2:ff";
    linkConfig.MTUBytes = 1400;

    networkConfig = {
      DHCP = "no";
      IPv6AcceptRA = false;
    };

    routes = [
      {
        Gateway = "10.0.0.1";
        GatewayOnLink = true;
      }
      {
        Gateway = "fd00::1";
        GatewayOnLink = true;
      }
    ];

    dns = [
      "8.8.8.8"
      "8.8.4.4"
      "2001:4860:4860::8888"
      "2001:4860:4860::8844"
    ];
  };

  systemd.services.systemd-networkd = {
    wants = [ "agenix-install-secrets.service" ];
    after = [ "agenix-install-secrets.service" ];
  };
}
