{ pkgs, ... }: {

  home.packages = with pkgs; [
    nix-output-monitor
    telegram-desktop
    spotify
    mas
  ];

}