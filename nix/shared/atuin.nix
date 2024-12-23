{ pkgs, ... }:

{
  enable = true;
  enableZshIntegration = true;
  settings = {
    style = "auto";
    sync_address = "https://api.atuin.sh";
    sync_frequency = "15m";
      auto_sync = true;
    theme = {
      name = "autumn"; # Specify your preferred theme
    };
  };
}
