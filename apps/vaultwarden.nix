{ config, pkgs, ... }: {
  age.secrets.cloudflared-vaultwarden = {
    file = ../secrets/cloudflared-vaultwarden.age;
    mode = "400";
  };

  virtualisation.podman.enable = true;
  virtualisation.oci-containers.backend = "podman";
  virtualisation.oci-containers.containers = {
    vaultwarden = {
      image = "docker.io/vaultwarden/server:1.37.4-alpine@sha256:19ea2b669945d842dadc3d500f2d6a795866a003330f59a47b9634658bae98bb";
      autoStart = true;
      environment = {
        DOMAIN = "https://vwbw.fortibrine.me";
        SIGNUPS_ALLOWED = "false";
        ROCKET_LOG = "critical";
      };
      volumes = [ "vaultwarden-data:/data" ];
    };
    cloudflared = {
      image = "docker.io/cloudflare/cloudflared:2026.10.3@sha256:faa8e0a1475f137c910be6025f43c8e4092fdd35461b31e19fd1390657a1ff39";
      autoStart = true;
      cmd = [ "tunnel" "--no-autoupdate" "run" ];
      environmentFiles = [ config.age.secrets.cloudflared-vaultwarden.path ];
      extraOptions = [ "--network=container:vaultwarden" ];
      dependsOn = [ "vaultwarden" ];
    };
  };
}
