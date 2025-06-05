{ pkgs, config, ... }: {

  programs.vscode = {
    enable = true;
    profiles.default = {
        enableUpdateCheck = false;
        enableExtensionUpdateCheck = false;
        userSettings = {
          # Disables initial startup
          "workbench.startupEditor"= "none";
          "workbench.welcomePage.walkthroughs.openOnInstall"= false;

          # UI Settings
          "editor.fontSize"= 16;
          "terminal.integrated.fontSize"= 14;
          "workbench.sideBar.location"= "right";
          "workbench.activityBar.location"= "bottom";
          "editor.cursorSmoothCaretAnimation"= "on";
          "window.commandCenter"= false;
          "editor.minimap.enabled"= false;
          "terminal.integrated.smoothScrolling"= true;
          "workbench.list.smoothScrolling"= true;
          "editor.smoothScrolling"= true;
          "workbench.colorTheme"= "AMOLED Black";
          
          # Editor Settings
          "security.workspace.trust.untrustedFiles"= "open";
          "files.autoSave"= "afterDelay";
          "terminal.integrated.enableMultiLinePasteWarning"= false;
          "explorer.confirmPasteNative"= false;
          "editor.formatOnSave"= true;
          "editor.formatOnPaste"= true;
          "explorer.confirmDelete"= false;

          # Copilot Settings
          "chat.agent.enabled"= true;
          "github.copilot.nextEditSuggestions.enabled"= true;
          "github.copilot.enable"= {
            "plaintext"= true;
            "markdown"= true;
          };  

          # Misc
          "containers.environment"= {
              "DOCKER_CONTEXT"= "colima";
          };
          
          # Extension Settings
          
          "git.confirmSync"= false;
          
          "lldb.launch.terminal"= "integrated";
          "makefile.configureOnOpen"= true;
          "git.autofetch"= true;
          "nix.enableLanguageServer"= true;
          "nix.serverPath"= "nixd";

      };
      
      extensions = with pkgs.vscode-marketplace; [
          meta4245.amoledblack
          jnoortheen.nix-ide
          ms-vscode-remote.remote-containers
          github.copilot
          ms-vscode.vscode-websearchforcopilot
          ms-vscode.vscode-copilot-vision
          ms-vsliveshare.vsliveshare
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "copilot-chat";
            publisher = "github";
            version = "0.27.3";
            sha256 = "b7zvbDzwJcHAp9tn2ibtyeErrH2KNbgqT4Ir7aqLMQg=";
          }
        ];
    };

    profiles.cpp = {
      userSettings = config.programs.vscode.profiles.default.userSettings;
      extensions = with pkgs.vscode-marketplace; 
        config.programs.vscode.profiles.default.extensions ++ [
          ms-vscode.cpptools-extension-pack
          ms-vscode.makefile-tools
          ms-vscode.cmake-tools
          llvm-vs-code-extensions.vscode-clangd
        ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "cpptools";
            publisher = "ms-vscode";
            version = "1.25.3";
            sha256 = "OVj+HEElMGz+KavVk8mvvveiuD1+1RR5uSI97pY0+SM=";
          }
        ];
    };

    profiles.java = {
      userSettings = config.programs.vscode.profiles.default.userSettings;
      extensions = with pkgs.vscode-marketplace; 
        config.programs.vscode.profiles.default.extensions ++ [
          redhat.java
          redhat.vscode-xml
          vscjava.vscode-java-debug
          vscjava.vscode-maven
          vscjava.vscode-java-test
          vscjava.vscode-java-dependency
          vscjava.vscode-java-pack
        ];
    };

  };





}