{ config, pkgs, ... }:

{
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          { criteria = "eDP-1"; status = "enable"; }
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
          { criteria = "HDMI-A-1"; status = "enable"; position = "0,0"; }
          { criteria = "eDP-1"; status = "disable"; }
        ];
      }
    ];
  };
}
