{ config, pkgs, ... }: {
  age.secrets.cloudflared-vaultwarden = {
    file = ../secrets/cloudflared-vaultwarden.age;
    mode = "400";
  };

  virtualisation.podman.enable = true;
  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers = {
    vaultwarden = {
      image = "docker.io/vaultwarden/server:1.37.2";
      autoStart = true;
      environment = {
        DOMAIN = "https://vwbw.fortibrine.me";
        SIGNUPS_ALLOWED = "false";
        ROCKET_LOG = "critical";
      };
      volumes = [ "vaultwarden-data:/data" ];
    };
    cloudflared = {
      image = "docker.io/cloudflare/cloudflared:2026.8.3";
      autoStart = true;
      cmd = [ "tunnel" "--no-autoupdate" "run" ];
      environmentFiles = [ config.age.secrets.cloudflared-vaultwarden.path ];
      extraOptions = [ "--network=container:vaultwarden" ];
      dependsOn = [ "vaultwarden" ];
    };
  };
}
