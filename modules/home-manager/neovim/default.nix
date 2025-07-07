{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      ripgrep

      # lua lsp
      lua-language-server

      # rust lsp
      rust-analyzer
      cargo
      rustc
    ];
  };

  home.file.".config/nvim" = {
    source = ./config;
    recursive = true;
  };
}
