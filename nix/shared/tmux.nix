{ pkgs, ... }:

let
  # Define the catppuccin Tmux theme plugin
  catppuccin = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "catppuccin";
    version = "unstable-2024-05-15";
    src = pkgs.fetchFromGitHub {
      owner = "catppuccin";
      repo = "tmux";
      rev = "697087f593dae0163e01becf483b192894e69e33";
      sha256 = "sha256-EHinWa6Zbpumu+ciwcMo6JIIvYFfWWEKH1lwfyZUNTo=";
    };
  };

  # Define the tmux-resurrect plugin
  resurrect = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "resurrect";
    version = "unstable-2022-05-01";
    src = pkgs.fetchFromGitHub {
      owner = "tmux-plugins";
      repo = "tmux-resurrect";
      rev = "ca6468e2deef11efadfe3a62832ae67742505432";
      hash = "sha256-wl9/5XvFq+AjV8CwYgIZjPOE0/kIuEYBNQqNDidjNFo=";
      fetchSubmodules = true;
    };
  };

  # Detect or install `zsh`
  zshPath = if pkgs.stdenv.isDarwin then "/bin/zsh" else "${pkgs.zsh}/bin/zsh";

in
  {
  enable = true;

  plugins = with pkgs.tmuxPlugins; [
    resurrect
    catppuccin
    vim-tmux-navigator
  ];

  extraConfig = ''
    set -g default-command "${zshPath}"

    set -g mouse on

    # Add these lines
    set-option -sa terminal-features ',xterm-256color:RGB'
    set -g default-terminal "xterm-256color"
    set -g @catppuccin_flavour 'mocha' # or your preferred flavor

    bind-key h select-pane -L
    bind-key j select-pane -D
    bind-key k select-pane -U
    bind-key l select-pane -R

    set-option -g status-position top
    set -sg escape-time 10

    set -g @catppuccin_window_left_separator ""
    set -g @catppuccin_window_right_separator " "
    set -g @catppuccin_window_middle_separator " █"
    set -g @catppuccin_window_number_position "right"

    set -g @catppuccin_window_default_fill "number"
    set -g @catppuccin_window_default_text "#W"

    set -g @catppuccin_window_current_fill "number"
    set -g @catppuccin_window_current_text "#W"

    set -g @catppuccin_status_modules_right "directory session"
    set -g @catppuccin_status_left_separator  " "
    set -g @catppuccin_status_right_separator ""
    set -g @catppuccin_status_right_separator_inverse "no"
    set -g @catppuccin_status_fill "icon"
    set -g @catppuccin_status_connect_separator "no"

    set -g @catppuccin_directory_text "#{pane_current_path}"
  '';
}
