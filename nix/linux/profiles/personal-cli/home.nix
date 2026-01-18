{ config, pkgs, ... }:

# Only CLI applications
{
# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

# Specify the username and home directory
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.stateVersion = "24.05"; # Update to match the Nixpkgs version you're using

# Import system-level packages from shared/modules/packages-cli.nix
    home.packages = pkgs.callPackage ../../../shared/modules/packages-cli.nix {} ++ [
# Add user-level packages here
    pkgs.btop
    pkgs.hollywood
    ];

# Manage dotfiles and configurations
  home.file = {
    ".config" = {
      source = ../../../../.config;
      recursive = true;
      force = true;
    };
  };

  programs = {
    zsh = (import ../../../shared/zsh.nix { inherit config pkgs; });
  };

# Enable Home Manager to manage itself
  programs.home-manager.enable = true;

}
