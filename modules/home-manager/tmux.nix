{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    historyLimit = 100000;
    extraConfig = ''
      # Use Alt as the modifier key
      set -g prefix M
      bind M send-prefix
      setw -g aggressive-resize on
      
      # Start window numbering at 1
      set -g base-index 1
      set -g pane-base-index 1
      setw -g automatic-rename on
      set-option -g renumber-windows on
      
      # Switch to a specific window using Alt + [1-9], creating it if necessary
      bind -n M-1 run 'tmux select-window -t 1 || tmux new-window -n 1'
      bind -n M-2 run 'tmux select-window -t 2 || tmux new-window -n 2'
      bind -n M-3 run 'tmux select-window -t 3 || tmux new-window -n 3'
      bind -n M-4 run 'tmux select-window -t 4 || tmux new-window -n 4'
      bind -n M-5 run 'tmux select-window -t 5 || tmux new-window -n 5'
      bind -n M-6 run 'tmux select-window -t 6 || tmux new-window -n 6'
      bind -n M-7 run 'tmux select-window -t 7 || tmux new-window -n 7'
      bind -n M-8 run 'tmux select-window -t 8 || tmux new-window -n 8'
      bind -n M-9 run 'tmux select-window -t 9 || tmux new-window -n 9'
      bind -n M-0 run 'tmux select-window -t 10 || tmux new-window -n 10'
      
      # Move current pane to a specific window using Alt + Shift + [1-9], creating it if necessary
      bind -n M-! run 'tmux move-window -t 1 || tmux new-window -n 1'
      bind -n M-@ run 'tmux move-window -t 2 || tmux new-window -n 2'
      bind -n M-# run 'tmux move-window -t 3 || tmux new-window -n 3'
      bind -n M-$ run 'tmux move-window -t 4 || tmux new-window -n 4'
      bind -n M-% run 'tmux move-window -t 5 || tmux new-window -n 5'
      bind -n M-^ run 'tmux move-window -t 6 || tmux new-window -n 6'
      bind -n M-& run 'tmux move-window -t 7 || tmux new-window -n 7'
      bind -n M-* run 'tmux move-window -t 8 || tmux new-window -n 8'
      bind -n M-( run 'tmux move-window -t 9 || tmux new-window -n 9'
      bind -n M-) run 'tmux move-window -t 10 || tmux new-window -n 10'
      
      # Create a new pane with Alt + Enter
      bind -n M-Enter split-window -h
      
      # Navigate between panes using Alt + h/j/k/l
      bind -n M-h select-pane -L
      bind -n M-j select-pane -D
      bind -n M-k select-pane -U
      bind -n M-l select-pane -R
      
      # Move panes using Alt + Shift + h/j/k/l
      bind -n M-H swap-pane -s '{left}'
      bind -n M-J swap-pane -s '{down}'
      bind -n M-K swap-pane -s '{up}'
      bind -n M-L swap-pane -s '{right}'
      
      bind-key -n C-M-h resize-pane -L 5
      bind-key -n C-M-j resize-pane -D 5
      bind-key -n C-M-k resize-pane -U 5
      bind-key -n C-M-l resize-pane -R 5
      
      # Kill current pane using Alt + q
      bind -n M-Q kill-pane

      set -g mouse on 
      setw -g mouse on
    '';
  };
}
