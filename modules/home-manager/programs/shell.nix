{ config ,pkgs, ...}: {
    home.packages = with pkgs; [
        zsh # Z shell, a powerful shell with scripting capabilities
        btop # Resource monitor, similar to htop but with more features
        bat # Bat is a cat clone with syntax highlighting and Git integration
        curl 
        aria2 # A lightweight multi-protocol & multi-source command-line download utility
        dua # Disk usage analyzer
        jq # Command-line JSON processor
        uv # An extremely fast Python package and project manager, written in Rust.
        duf # Disk usage utility
        lnav # Log file navigator
        fzy # Fuzzy finder
        httpie # Command-line HTTP client, user-friendly cURL replacement
        wget 
        chezmoi # Manage your dotfiles across multiple machines
        trash-cli # Command-line trash can for Linux and macOS
        eza # A modern replacement for ls, with more features and better defaults
        zoxide # A smarter cd command, like z or autojump
        coreutils # GNU core utilities
        zellij # A terminal workspace with a focus on usability and extensibility
        macpm # Also known as 'asitop', a macOS btop
        # Git related tools
        git
        gh # GitHub CLI
        lazygit # Terminal UI for Git commands
        lazydocker # Terminal UI for Docker commands
    ];
  
    home.sessionVariables = {
        EDITOR = "nvim"; # Set Neovim as the default editor
        LANG = "en_US.UTF-8"; # Set the default language
        LC_ALL = "en_US.UTF-8"; # Set locale to US English
    };
    
    programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
    };
    
    programs.zsh = {
      enable = true;
      autocd = true;
      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch.enable = true;

      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];
    };
    
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          add_newline = false;
          character = {
            success_symbol = "[➜](bold green)";
            error_symbol = "[✗](bold red)";
          };
          directory = {
            truncation_length = 3;
            truncation_symbol = "…/";
          };
          git_branch = {
            symbol = "🌱 ";
            truncation_length = 20;
            truncation_symbol = "…";
          };
          nix_shell = {
            symbol = "❄️ ";
            format = "via [$symbol$state]($style) ";
          };
        };
    };
    
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
    
    programs.gh = {
      enable = true;
      gitCredentialHelper = {
          enable = true;
      };
    };
    
    home.file = {
      #".zsh-aliases".source = ../dotfiles/zsh-aliases;
      "${config.xdg.configHome}" = {
          source = ../dotfiles/.config;
          recursive = true;
      };
    };
    
    home.shellAliases = {
      ls = "eza -la --git --color=always";
      dequarantine = "sudo xattr -r -d com.apple.quarantine";
      cd = "z";
      down = "aria2c -s16 -x16";
      dnslookup = "dscacheutil -q host -a name ";
      dnsflush = "sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder";
      
      # Nix commands
      nixupdate = "sudo -E darwin-rebuild switch --flake ~/Documents/nix-config#macos";
      nixgc = "nix-collect-garbage";
    };
    
    
    
    
}