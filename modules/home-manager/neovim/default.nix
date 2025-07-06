{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      ripgrep
      stylua
    ];
  };

  home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };
}
