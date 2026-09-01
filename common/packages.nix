{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    btop
    git
    fastfetch
    cpufetch
    speedtest-go
    nftables
    zellij
  ];
}
