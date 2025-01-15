{ config, pkgs, ... }:

{
# Home Manager needs a bit of information about you and the
# paths it should manage.
  home.username = "abhishekdeshpande";
  home.homeDirectory = "/Users/abhishekdeshpande";
  home.stateVersion = "24.05";

# Packages to install
  home.packages = [
  ];

# Add the LazyVim installation script here
  home.activation.installLazyVim = ''
    echo "Starting LazyVim installation..."
    NVIM_CONFIG="${config.xdg.configHome}/nvim"

# Check if the ~/.config/nvim directory does NOT exist
    if [ ! -d "$NVIM_CONFIG" ]; then
      echo "No nvim directory found. Setting up LazyVim..."

        rm -rf "$NVIM_CONFIG"
        mkdir -p "$NVIM_CONFIG"
        ${pkgs.git}/bin/git clone https://github.com/LazyVim/starter "$NVIM_CONFIG"
        rm -rf "$NVIM_CONFIG/.git"

        echo "LazyVim installed successfully!"
    else
      echo "nvim directory already exists, skipping LazyVim installation"
        fi
        '';

# Manage files
  home.file = {
    ".config/nvim/lua/config/autocmds.lua" = {
      source = ../../.config/nvim/lua/config/autocmds.lua;
      force = true;
    };
    ".config/nvim/lua/config/keymaps.lua" = {
      source = ../../.config/nvim/lua/config/keymaps.lua;
      force = true;
    };
    ".config/nvim/lua/config/lazy.lua" = {
      source = ../../.config/nvim/lua/config/lazy.lua;
      force = true;
    };
    ".config/nvim/lua/config/options.lua" = {
      source = ../../.config/nvim/lua/config/options.lua;
      force = true;
    };
    ".config/nvim/lua/plugins/colorscheme.lua" = {
      source = ../../.config/nvim/lua/plugins/colorscheme.lua;
      force = true;
    };
    ".config/nvim/lua/plugins/genAI.lua" = {
      source = ../../.config/nvim/lua/plugins/genAI.lua;
      force = true;
    };
    ".config/nvim/lua/plugins/leetcode.lua" = {
      source = ../../.config/nvim/lua/plugins/leetcode.lua;
      force = true;
    };
    ".config/nvim/lua/plugins/vimTmuxNav.lua" = {
      source = ../../.config/nvim/lua/plugins/vimTmuxNav.lua;
      force = true;
    };
    ".config/ghostty/config" = {
      source = ../../.config/ghostty/config;
      force = true;
    };
  };

  programs = {
    neovim = (import ../shared/neovim.nix { inherit config pkgs; });
    zsh = (import ../shared/zsh.nix { inherit config pkgs; });
    vim = (import ../shared/vim.nix { inherit config pkgs; });
    tmux = (import ../shared/tmux.nix { inherit config pkgs; });
    starship = (import ../shared/starship.nix { inherit config pkgs; });
    atuin = (import ../shared/atuin.nix { inherit config pkgs; });
  };

# Enable Home Manager to manage itself
  programs.home-manager.enable = true;

}
