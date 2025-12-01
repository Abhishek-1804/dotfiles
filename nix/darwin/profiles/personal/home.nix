{ config, pkgs, ... }:

{
  home.stateVersion = "24.05";

  # Packages to install
  home.packages = [
  ];

  # Manage files
  home.file = {
    ".config" = {
      source = ../../../../.config;
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
