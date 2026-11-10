{
  age.secrets.network-addresses = {
    file = ../../secrets/envious-violet-caribou/network-addresses.age;
    mode = "0444";
    path = "/etc/systemd/network/10-ens3.network.d/50-addresses.conf";
  };

  networking.useDHCP = false;
  networking.useNetworkd = true;

  systemd.network.enable = true;

  systemd.network.networks."10-ens3" = {
    matchConfig.Name = "ens3";

    routes = [
      {
        Gateway = "10.0.0.1";
        GatewayOnLink = true;
      }
    ];

    dns = [
      "1.1.1.1"
      "1.0.0.1"
    ];
  };

  systemd.services.systemd-networkd = {
    wants = [ "agenix-install-secrets.service" ];
    after = [ "agenix-install-secrets.service" ];
  };
}
