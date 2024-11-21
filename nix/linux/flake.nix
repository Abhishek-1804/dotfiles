{
  description = "Top Level Linux System Flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs@{ self, nixpkgs, home-manager }: 
    let
      configuration = { pkgs, ... }: {
        # Allow unfree packages if needed
        nixpkgs.config.allowUnfree = true;

        # System packages
        environment.systemPackages = pkgs.callPackage ../shared/modules/packages.nix {} ++ [
          # CLI tools
          pkgs.git
          pkgs.openssh

        ];

        # Import additional configurations if needed
        imports = [];

      };
    in {
      # Define configurations for different Linux systems
      nixosConfigurations = {
        "my-linux-server" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            configuration
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.abhishekdeshpande = import ./home.nix;
            }
          ];
        };
      };
    };
}
