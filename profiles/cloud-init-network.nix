{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.netplan ];

  networking.useDHCP = false;
  networking.useNetworkd = true;

  services.cloud-init = {
    enable = true;
    network.enable = true;
    settings = {
      system_info.network = {
        renderers = [ "netplan" ];
        activators = [ "netplan" "networkd" ];
      };
    };
  };
}
