{ config, pkgs, ... }:

# Includes GUI applications
{
# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

# Specify the username and home directory
  home.username = builtins.getEnv "USER";
  home.homeDirectory = builtins.getEnv "HOME";
  home.stateVersion = "24.05"; # Update to match the Nixpkgs version you're using

 # Import system-level packages from shared/modules/packages.nix
     home.packages = pkgs.callPackage ../../../shared/modules/packages.nix {} ++ [
 # Add user-level packages here
     pkgs.btop
     pkgs.hollywood
     pkgs.raycast
     ];

# Manage dotfiles and configurations
  home.file = {
    ".config/ghostty/config" = {
      source = ../../../../.config/ghostty/config;
      force = true;
    };
    ".config/nvim" = {
      source = ../../../../.config/nvim;
      recursive = true;
      force = true;
    };
  };

  programs = {
    neovim = (import ../../../shared/neovim.nix { inherit config pkgs; });
    zsh = (import ../../../shared/zsh.nix { inherit config pkgs; });
    vim = (import ../../../shared/vim.nix { inherit config pkgs; });
    zellij = (import ../../../shared/zellij.nix { inherit config pkgs; });
    tmux = (import ../../../shared/tmux.nix { inherit config pkgs; });
    starship = (import ../../../shared/starship.nix { inherit config pkgs; });
    atuin = (import ../../../shared/atuin.nix { inherit config pkgs; });
  };

# Enable Home Manager to manage itself
  programs.home-manager.enable = true;

}
