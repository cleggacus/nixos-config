{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    theme.package = pkgs.dracula-theme;
  };
}
