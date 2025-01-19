{
  description = "Flake for Linux";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager }: {
    homeConfigurations = {
      # Full profile with all packages
      everything = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./profiles/everything/home.nix
        ];
      };

      # Minimal profile with essential packages only
      minimal = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./profiles/minimal/home.nix
        ];
      };
    };
  };
}
