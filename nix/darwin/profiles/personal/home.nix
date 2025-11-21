{ config, pkgs, ... }:

{
  home.stateVersion = "24.05";

  # Packages to install
  home.packages = [
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
