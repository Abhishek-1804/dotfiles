{ config, pkgs, ... }:

{
  home.stateVersion = "24.05";

  # Packages to install
  home.packages = [
  pkgs.starship
  pkgs.atuin
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
    zsh = (import ../../../shared/zsh.nix { inherit config pkgs; });
  };

  # Enable Home Manager to manage itself
  programs.home-manager.enable = true;

}
