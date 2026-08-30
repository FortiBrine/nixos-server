{ pkgs, ... }: {
  users.users.fortibrine = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
  };
}
