let
  users = [ ];

  oracle-server1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINyM33AXwo+ZcS7a9FsEKbmqQ2pPcSw0n6F8NYaRkAKk root@oracle-server1";
  servers = [ oracle-server1 ];
in
{
  "cloudflared-vaultwarden.age".publicKeys = users ++ servers;
}
