{ pkgs, ... }:

{
  enable = true;
  enableZshIntegration = true;
  settings = {
    style = "auto";
    sync_address = "https://api.atuin.sh";
    sync_frequency = "15m";
    auto_sync = true;
    enter_accept = true;  # Add this line to enable enter to accept
      theme = {
        name = "autumn"; # Specify your preferred theme
      };
  };
}
