{ pkgs, ... }: {

  programs.vscode = {
    enable = true;
    userSettings = {
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
        "github.copilot.editor.enableAutoCompletions"= true;
        "github.copilot.enable"= {
            "markdown"= true;
            "plaintext"= true;
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
        Meta4245.amoledblack
        jnoortheen.nix-ide
        ms-vscode-remote.remote-containers
    ];

  };





}