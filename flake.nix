{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, ... }@inputs :
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [
        (final: prev: {
	  swayfx = prev.swayfx.overrideAttrs {
            version = "0.5.3";
            src = prev.fetchFromGitHub {
              owner = "WillPower3309";
              repo = "swayfx";
              tag = "0.5.3";
              sha256 = "1d4srsp1c4dfq7qqcccbqw0jwn9ghzqhkvgr1msgs7r1jkk4v4sd";
            };
          };
        })
      ];
    };
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/nixos/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
