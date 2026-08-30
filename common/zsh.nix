{
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
      theme = "bira";
    };
  };
  system.userActivationScripts.zshrc = "touch .zshrc";
}
