{ config, pkgs, ... }:

{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Specify the username and home directory
  home.username = "akdp";
  # For root user
  # home.homeDirectory = "/root";
  home.homeDirectory = "/home/akdp";
  home.stateVersion = "24.05"; # Update to match the Nixpkgs version you're using

  # Import system-level packages from shared/modules/packages.nix
  home.packages = pkgs.callPackage ../../../shared/modules/essentials.nix {} ++ [
    # Add user-level packages here
    pkgs.btop
  ];

  # Manage dotfiles and configurations
  home.file = {
    ".config/ghostty/config" = {
      source = ../../../../.config/ghostty/config;
      force = true;
    };
    ".config/nvim/lua/config/autocmds.lua" = {
      source = ../../../../.config/nvim/lua/config/autocmds.lua;
      force = true;
    };
    ".config/nvim/lua/config/keymaps.lua" = {
      source = ../../../../.config/nvim/lua/config/keymaps.lua;
      force = true;
    };
    ".config/nvim/lua/config/lazy.lua" = {
      source = ../../../../.config/nvim/lua/config/lazy.lua;
      force = true;
    };
    ".config/nvim/lua/config/options.lua" = {
      source = ../../../../.config/nvim/lua/config/options.lua;
      force = true;
    };
    ".config/nvim/lua/plugins/colorscheme.lua" = {
      source = ../../../../.config/nvim/lua/plugins/colorscheme.lua;
      force = true;
    };
    ".config/nvim/lua/plugins/nvimZellijNav.lua" = {
      source = ../../../../.config/nvim/lua/plugins/nvimZellijNav.lua;
      force = true;
    };
  };

  programs = {
    neovim = (import ../../../shared/neovim.nix { inherit config pkgs; });
    zsh = (import ../../../shared/zsh.nix { inherit config pkgs; });
    vim = (import ../../../shared/vim.nix { inherit config pkgs; });
    zellij = (import ../../../shared/zellij.nix { inherit config pkgs; });
    starship = (import ../../../shared/starship.nix { inherit config pkgs; });
    atuin = (import ../../../shared/atuin.nix { inherit config pkgs; });
  };

  # Enable Home Manager to manage itself
  programs.home-manager.enable = true;

}
