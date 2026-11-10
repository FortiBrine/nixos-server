let
  users = [ ];

  oracle-server1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINyM33AXwo+ZcS7a9FsEKbmqQ2pPcSw0n6F8NYaRkAKk root@oracle-server1";
  mexican-pearl18408 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPu7pt/QXlMZDKbY9RUGO3gjJ/lrsFXYdS+TMcnzS0Ws";
  envious-violet-caribou = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILFeLMYunBr8v8Jw+v1LUkoASH5wxTHOgeGqgezSWt/g root@envious-violet-caribou";

  servers = [ oracle-server1 mexican-pearl18408 envious-violet-caribou ];
in
{
  "cloudflared-vaultwarden.age".publicKeys = [
    oracle-server1
  ];

  "mexican-pearl18408/network-addresses.age".publicKeys = [
    mexican-pearl18408
  ];

  "mexican-pearl18408/wireguard-server-private-key.age".publicKeys = [
    mexican-pearl18408
  ];

  "mexican-pearl18408/wireguard-client-client1-psk.age".publicKeys = [
    mexican-pearl18408
  ];

  "mexican-pearl18408/wireguard-client-client2-psk.age".publicKeys = [
    mexican-pearl18408
  ];

  "envious-violet-caribou/network-addresses.age".publicKeys = [
    envious-violet-caribou
  ];

}
