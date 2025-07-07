{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      swayfx = super.swayfx.overrideAttrs (oldAttrs: rec {
        version = "0.5.3";
        src = super.fetchFromGitHub {
          owner = "WillPower3309";
          repo = "swayfx";
          tag = "0.5.3";
          sha256 = "1d4srsp1c4dfq7qqcccbqw0jwn9ghzqhkvgr1msgs7r1jkk4v4sd";
        };
      });
    })
  ];
}
