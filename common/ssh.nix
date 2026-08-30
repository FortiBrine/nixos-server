{
  services.openssh = {
    enable = true;
    ports = [ 2222 ];
#     openFirewall = false;
    settings = {
      AllowUsers = [ "fortibrine" ];

      PasswordAuthentication = false;
      ChallengeResponseAuthentication = false;
      UsePAM = true;
      PubkeyAuthentication = true;
      PermitRootLogin = "no";
      MaxAuthTries = 3;
      MaxSessions = 5;
      ClientAliveInterval = 300;
      ClientAliveCountMax = 2;
      LoginGraceTime = 60;
      PermitEmptyPasswords = false;
      X11Forwarding = false;
      LogLevel = "VERBOSE";
    };

  };

  services.sshguard = {
    enable = true;

    attack_threshold = 30;
    blocktime = 1800;
    detection_time = 3600;
  };

  security.sudo.wheelNeedsPassword = false;

}
