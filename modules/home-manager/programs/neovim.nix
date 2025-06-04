{ pkgs, ... }: {
  home.packages = with pkgs; [
    lunarvim # A Neovim configuration framework
  ];
}