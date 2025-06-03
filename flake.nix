{
  description = "pucciaOS Configuration";
  inputs = {
    # Where we get most of our software. Giant mono repo with recipes
    # called derivations that say how to build software.
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # nixos-22.11

    # Manages configs links things into your home directory
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Controls system level software and settings including fonts
    darwin.url = "github:nix-darwin/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Homebrew installer 
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    mac-app-util.url = "github:hraban/mac-app-util";

    # Visual Studio Code extensions
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions/master";


  };
  outputs = inputs@{ 
    nixpkgs, home-manager, nix-homebrew, nix-vscode-extensions, mac-app-util, darwin, ... }: {
    darwinConfigurations.macos = darwin.lib.darwinSystem {
      
      system = "aarch64-darwin";
      pkgs = import nixpkgs { 
        system = "aarch64-darwin";  
        config = { 
          allowUnfree = true; 
          allowBroken = true; 
          allowUnsupportedSystem = true;
        };
        overlays = [
            nix-vscode-extensions.overlays.default
          ];
        settings.experimental-features = "nix-command flakes";
      };
      
      modules = [
        ./modules/darwin
        mac-app-util.darwinModules.default
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install Homebrew under the default prefix
            enable = true;

            # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
            # enableRosetta = true;

            # User owning the Homebrew prefix
            user = "mattia";
          };
        }
        home-manager.darwinModules.home-manager
        {
          users.users.mattia.home = "/Users/mattia";
          home-manager = {
            # Link installed mac apps to the user's home directory
            sharedModules = [
                mac-app-util.homeManagerModules.default
            ];
            backupFileExtension = "bak";
            useGlobalPkgs = true;
            useUserPackages = true;
            users.mattia.imports = [ ./modules/home-manager ];
          };
        }
      ];
    };
  };
}
