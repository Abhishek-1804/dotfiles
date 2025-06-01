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
      personal = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = builtins.currentSystem; };
        modules = [
          ./profiles/personal/home.nix
        ];
      };

      # Minimal profile with essential packages only
      minimal = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = builtins.currentSystem; };
        modules = [
          ./profiles/minimal/home.nix
        ];
      };
    };
  };
}
