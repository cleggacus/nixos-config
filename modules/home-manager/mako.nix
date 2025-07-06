{ config, pkgs, ... }:

{
  services.mako = {
    enable = true;
    extraConfig = ''
      background-color=#282a36
      text-color=#F8F8F2
      border-color=#44475A

      outer-margin=10

      padding=10
      border-radius=10
      width=299
      height=99
      
      [urgency=low]
      border-color=#44475A
      
      [urgency=normal]
      border-color=#f1fa8c
      
      [urgency=high]
      border-color=#ff5555
    '';
  };
}
