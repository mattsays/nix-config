{ pkgs, config, ... }: {

  programs.vscode = {
    enable = true;
    mutableExtensionsDir = true;
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
          "editor.cursorSmoothCaretAnimation"= true;
          "editor.cursorBlinking" = "smooth";
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

          "redhat.telemetry.enabled"= false;

      };
      
      extensions = with pkgs.vscode-marketplace; [
          meta4245.amoledblack
          jnoortheen.nix-ide
          mkhl.direnv
          ms-vscode-remote.remote-containers
          github.copilot
          ms-vscode.vscode-websearchforcopilot
          ms-vscode.vscode-copilot-vision
          ms-vsliveshare.vsliveshare
      ];
    };

  };

}
