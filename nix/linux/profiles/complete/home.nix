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

  # Manage files
  ## Loop over .config/ files and apply those configs
  home.file = let
    configDir = ../../../../.config;
  in builtins.mapAttrs (name: type: {
    source = configDir + "/${name}";
    recursive = type == "directory";
    force = true;
  }) (builtins.readDir configDir);

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
