{ pkgs, ... }:

{
  enable = true;
  enableZshIntegration = true;
  settings = {
    style = "compact";
    sync_address = "https://api.atuin.sh";
    auto_sync = true;
    theme = {
      name = "autumn"; # Change to your preferred theme
    };
  };
}
