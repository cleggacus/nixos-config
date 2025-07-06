{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
  
    settings = {
      show = "run";
      lines = 8;
      eh = 2;
      width = 500;
      yoffset = -20;  # Moves the window 20 pixels up
      xoffset = 0;    # Centers the window horizontally

    };
  
    style = ''
      window {
        margin: 0;
        border: 2px solid #44475A;
        background-color: #282a36;
	border-radius: 10px;
      }
  
      #input {
        margin: 5px;
        border: none;
        color: #f8f8f2;
        background-color: #44475a;
      }
  
      #inner-box {
        margin: 5px;
        border: none;
        background-color: #282a36;
      }
  
      #outer-box {
        margin: 5px;
        border: none;
        background-color: #282a36;
      }
  
      #scroll {
        margin: 0px;
        border: none;
      }
  
      #text {
        margin: 5px;
        border: none;
        color: #f8f8f2;
      }
  
      #entry:selected {
        background-color: #44475a;
      }
    '';
  };
}
