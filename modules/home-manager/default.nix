{ pkgs, ... }: {
  # Don't change this when you change package input. Leave it alone.
  home.stateVersion = "25.05";
  
  home.sessionVariables = {
    EDITOR = "nvim";
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    JAVA_HOME = "${pkgs.jdk23}";
  };
  
  imports = [
    ./programs/misc.nix
    ./programs/neovim.nix
    ./programs/shell.nix
    ./programs/vscode.nix
  ];

  
  # specify my home-manager configs
  home.packages = with pkgs; [
    
    # Nix related tools
    nixd
    nil
    direnv
    devenv
    
    # Docker
    docker
    colima # Docker engine alternative for macOS, Linux, and Windows
    
    # Java
    jdk23
      
    home-manager    
  ];
  
}