{
  description = "Flake for Linux";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Periodically 'nix store optimise' and 'nix-collect-garbage -d'
  # Also 'nix flake update'

  outputs = { self, nixpkgs, home-manager }: {
    homeConfigurations = {
      # Full CLI and GUI profile with all packages
      complete = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = builtins.currentSystem; };
        modules = [
          ./profiles/complete/home.nix
        ];
      };

      # Full CLI profile with all packages
      personal-cli = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = builtins.currentSystem; };
        modules = [
          ./profiles/personal-cli/home.nix
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
