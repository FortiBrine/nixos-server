{ config, ... }: {
  age.secrets = {
    wireguard-server-private-key = {
      file = ../../secrets/mexican-pearl18408/wireguard-server-private-key.age;
      mode = "0400";
    };

    wireguard-client-client1-psk = {
      file = ../../secrets/mexican-pearl18408/wireguard-client-client1-psk.age;
      mode = "0400";
    };

    wireguard-client-client2-psk = {
      file = ../../secrets/mexican-pearl18408/wireguard-client-client2-psk.age;
      mode = "0400";
    };
  };

  networking.wireguard = {
    useNetworkd = true;

    interfaces.wg0 = {
      ips = [
        "10.8.0.1/24"
        "fd42:8:8::1/64"
      ];

      listenPort = 51820;
      privateKeyFile = config.age.secrets.wireguard-server-private-key.path;

      peers = [
        {
          name = "client1";
          publicKey = "xoWnpEzzEQNjTdJVpbz/r1J2fNTkntFbepGeyOWxRH4=";
          presharedKeyFile = config.age.secrets.wireguard-client-client1-psk.path;
          allowedIPs = [
            "10.8.0.2/32"
            "fd42:8:8::2/128"
          ];
        }
        {
          name = "client2";
          publicKey = "rGQCXWqJW70IixTqweVqKUERZ0bABBlDCFPgSsNzVTQ=";
          presharedKeyFile = config.age.secrets.wireguard-client-client2-psk.path;
          allowedIPs = [
            "10.8.0.3/32"
            "fd42:8:8::3/128"
          ];
        }
      ];
    };
  };

  boot.kernel.sysctl = {
    "net.ipv4.ip_forward" = 1;
    "net.ipv6.conf.all.forwarding" = 1;
  };

  networking.firewall.allowedUDPPorts = [ 51820 ];

  networking.nat = {
    enable = true;
    enableIPv6 = true;
    externalInterface = "ens3";
    internalInterfaces = [ "wg0" ];
  };
}
