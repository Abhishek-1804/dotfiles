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
      sha256 = "0d7jg5dy4jq64679rf2zqmqbvgiqvpcj5jxfljk7d7y86dnqhj3n";
    };
  };

in
{
  enable = true;

  aggressiveResize = true;
  baseIndex = 1;
  disableConfirmationPrompt = true;

  plugins = with pkgs.tmuxPlugins; [
    resurrect
    catppuccin
    vim-tmux-navigator
  ];

  extraConfig = ''
    set -g mouse on

    bind-key h select-pane -L
    bind-key j select-pane -D
    bind-key k select-pane -U
    bind-key l select-pane -R

    set-option -g status-position top
    set -sg escape-time 10

    set -g @catppuccin_window_status_style "rounded"
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
    set -g @catppuccin_status_fill "icon"
    set -g @catppuccin_status_connect_separator "no"

    set -g @catppuccin_directory_text "#{pane_current_path}"
  '';
}
