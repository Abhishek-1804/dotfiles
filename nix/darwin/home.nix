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
    ".zshrc".source = ../../.zshrc;
    ".vimrc".source = ../../.vimrc;
    ".tmux.conf".source = ../../.tmux.conf;
    ".config/nvim/lua/config/autocmds.lua".source = ../../.config/nvim/lua/config/autocmds.lua;
    ".config/nvim/lua/config/keymaps.lua".source = ../../.config/nvim/lua/config/keymaps.lua;
    ".config/nvim/lua/config/lazy.lua".source = ../../.config/nvim/lua/config/lazy.lua;
    ".config/nvim/lua/config/options.lua".source = ../../.config/nvim/lua/config/options.lua;
    ".config/nvim/lua/plugins/colorscheme.lua".source = ../../.config/nvim/lua/plugins/colorscheme.lua;
    ".config/nvim/lua/plugins/genAI.lua".source = ../../.config/nvim/lua/plugins/genAI.lua;
    ".config/nvim/lua/plugins/leetcode/lua".source = ../../.config/nvim/lua/plugins/leetcode.lua;
    ".config/nvim/lua/plugins/vimTmuxNav.lua".source = ../../.config/nvim/lua/plugins/vimTmuxNav.lua;
    ".config/starship.toml".source = ../../.config/starship.toml;
  };

  # Enable Home Manager to manage itself
  programs.home-manager.enable = true;

}
