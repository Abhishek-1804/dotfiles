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

  # Manage files
  home.file = {
    ".config/nvim/lua/config/autocmds.lua".source = ../../.config/nvim/lua/config/autocmds.lua;
    ".config/nvim/lua/config/keymaps.lua".source = ../../.config/nvim/lua/config/keymaps.lua;
    ".config/nvim/lua/config/lazy.lua".source = ../../.config/nvim/lua/config/lazy.lua;
    ".config/nvim/lua/config/options.lua".source = ../../.config/nvim/lua/config/options.lua;
    ".config/nvim/lua/plugins/colorscheme.lua".source = ../../.config/nvim/lua/plugins/colorscheme.lua;
    ".config/nvim/lua/plugins/genAI.lua".source = ../../.config/nvim/lua/plugins/genAI.lua;
    ".config/nvim/lua/plugins/leetcode/lua".source = ../../.config/nvim/lua/plugins/leetcode.lua;
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
