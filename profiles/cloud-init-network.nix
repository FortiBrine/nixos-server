{
  services.cloud-init = {
    enable = true;
    network.enable = true;

    settings = {
      cloud_final_modules = [];
    };
  };
}
