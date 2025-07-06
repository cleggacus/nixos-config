{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    extraPackages = with pkgs; [
      ripgrep
      stylua
    ];
  };

  xdg.configFile."nvim".source = pkgs.lib.cleanSource ./config;
}
