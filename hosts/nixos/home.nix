{ config, pkgs, ... }:


{
  imports = [
    ../../modules/home-manager/sway.nix
    ../../modules/home-manager/kanshi.nix
    ../../modules/home-manager/fonts.nix
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/gh.nix
    ../../modules/home-manager/dev.nix
    ../../modules/home-manager/btop.nix
    ../../modules/home-manager/neovim/default.nix
  ];

  home.username = "cleggacus";
  home.homeDirectory = "/home/cleggacus";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.packages = with pkgs; [
    google-chrome
    discord
    networkmanagerapplet

    gcc
    wl-clipboard
    xclip

    pavucontrol
    dracula-theme
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  home.sessionPath = [
    "$HOME/.local/share/nvim/mason/bin"
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
