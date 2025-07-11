{ pkgs, ... }: {
  # here go the darwin preferences and config items
  # programs.zsh.enable = true;

  nix = {
    enable = true;
  };
  
  system.primaryUser = "mattia";
  security.pam.services.sudo_local.touchIdAuth = true;

  networking.computerName = "pucciabook";
  networking.hostName = "pucciabook";

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;
  
  system.defaults = {

    dock.autohide = false;
    
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      NSNavPanelExpandedStateForSaveMode = true;
    };

    menuExtraClock.Show24Hour = true;
    menuExtraClock.ShowSeconds = true;
    menuExtraClock.ShowDate = 0;

  };

   environment = {
    shells = [ pkgs.bash pkgs.zsh ];
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
  };
  
  homebrew = {
      enable = true;
      onActivation.cleanup = "zap";
      onActivation.upgrade = true;
      onActivation.autoUpdate = true;

      masApps = {
          "bitwarden" = 1352778147;
          "Command X" = 6448461551;
      };

      taps = [];

      brews = [
      ];

      caskArgs = {
        no_quarantine = true;
      };
      casks = [
        "ghostty"
        "whatsapp"
        "pearcleaner"
        "the-unarchiver"
      ];
  };
  

  users.users.mattia.shell = pkgs.zsh;
  
  # services.nix-daemon.enable = true;
  ids.gids.nixbld = 350;
  # backwards compat; don't change
  system.stateVersion = 6;
}