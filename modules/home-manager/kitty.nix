{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font.name = "Fira Code";
    font.size = 12;

    extraConfig = ''
      # Dracula Theme for Kitty
      foreground            #f8f8f2
      background            #282a36
      selection_foreground  #ffffff
      selection_background  #44475a

      url_color #8be9fd

      # black
      color0  #21222c
      color8  #6272a4

      # red
      color1  #ff5555
      color9  #ff6e6e

      # green
      color2  #50fa7b
      color10 #69ff94

      # yellow
      color3  #f1fa8c
      color11 #ffffa5

      # blue
      color4  #bd93f9
      color12 #d6acff

      # magenta
      color5  #ff79c6
      color13 #ff92df

      # cyan
      color6  #8be9fd
      color14 #a4ffff

      # white
      color7  #f8f8f2
      color15 #ffffff

      # Cursor colors
      cursor            #f8f8f2
      cursor_text_color background

      # Tab bar colors
      active_tab_foreground   #282a36
      active_tab_background   #f8f8f2
      inactive_tab_foreground #282a36
      inactive_tab_background #6272a4

      # Marks
      mark1_foreground #282a36
      mark1_background #ff5555

      # Splits/Windows
      active_border_color   #f8f8f2
      inactive_border_color #6272a4

      # Custom Settings
      window_padding_width 10
      window_padding_height 10
      background_opacity 0.8
    '';
  };
}
