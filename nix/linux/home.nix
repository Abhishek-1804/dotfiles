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
  home.packages = pkgs.callPackage ../shared/modules/packages.nix {} ++ [
    # Add user-level packages here
    pkgs.git
    pkgs.btop
  ];

  # Manage dotfiles and configurations
  home.file = {
    ".config/nvim/lua/config/autocmds.lua".source = ../../.config/nvim/lua/config/autocmds.lua;
    ".config/nvim/lua/config/keymaps.lua".source = ../../.config/nvim/lua/config/keymaps.lua;
    ".config/nvim/lua/config/lazy.lua".source = ../../.config/nvim/lua/config/lazy.lua;
    ".config/nvim/lua/config/options.lua".source = ../../.config/nvim/lua/config/options.lua;
    ".config/nvim/lua/plugins/colorscheme.lua".source = ../../.config/nvim/lua/plugins/colorscheme.lua;
    ".config/nvim/lua/plugins/genAI.lua".source = ../../.config/nvim/lua/plugins/genAI.lua;
    ".config/nvim/lua/plugins/leetcode.lua".source = ../../.config/nvim/lua/plugins/leetcode.lua;
    ".config/nvim/lua/plugins/vimTmuxNav.lua".source = ../../.config/nvim/lua/plugins/vimTmuxNav.lua;
  };

  programs = {
    zsh = (import ../shared/zsh.nix { inherit config pkgs; });
    vim = (import ../shared/vim.nix { inherit config pkgs; });
    tmux = (import ../shared/tmux.nix { inherit config pkgs; });
    starship = (import ../shared/starship.nix { inherit config pkgs; });
  };

  # Enable Home Manager to manage itself
  programs.home-manager.enable = true;

}
