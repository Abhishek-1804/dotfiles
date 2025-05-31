{ pkgs, ... }:

{
  enable = true;
  enableZshIntegration = true;
  settings = {
    style = "auto";
    auto_sync = false;
    enter_accept = true;  # Add this line to enable enter to accept
      theme = {
        name = "autumn"; # Specify your preferred theme
      };
  };
}
