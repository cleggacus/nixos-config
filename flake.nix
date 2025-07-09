{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    swayfx.url = "github:WillPower3309/swayfx";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, swayfx, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };

      modules = [
        ./hosts/nixos/configuration.nix
        inputs.home-manager.nixosModules.default
	{
          nixpkgs.overlays = [
            (final: prev: {
              swayfx = swayfx.packages.${prev.system}.default;
            })
          ];
	}
      ];
    };
  };
}

