{ config, pkgs, ... }:

let
  dracula-zsh = builtins.fetchGit {
    url = "https://github.com/dracula/zsh";
    rev = "75ea3f5e1055291caf56b4aea6a5d58d00541c41";
  };
in
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
	"git"
      ];
      theme = "dracula";
      custom = "${dracula-zsh}";
    };
  };
}

