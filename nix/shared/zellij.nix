{ pkgs, ... }:

{
  enable = true;

  settings = {
    plugins = {
      autolock = {
        # Specify where to fetch the .wasm from GitHub Releases
        _props = {
          location = "https://github.com/fresh2dev/zellij-autolock/releases/download/0.2.2/zellij-autolock.wasm";
        };
        # Enable the plugin
        is_enabled = { _args = [ true ]; };
        # List of processes to trigger 'Locked' mode (use pipe '|' to OR multiple)
        triggers = { _args = [ "vim|nvim|helix|fzf|zoxide|gh" ]; };
        # How quickly (in seconds) to react to a process change
        reaction_seconds = { _args = [ "0.3" ]; };
        # Whether to print plugin events to the Zellij log
        print_to_log = { _args = [ true ]; };
      };
    };

    # Instruct Zellij to actually load the 'autolock' plugin at startup
    load_plugins = {
      autolock = {};
    };

    keybinds = {
      shared = {
        # 4 separate “bind … { … }” nodes
        "bind \"Alt h\"" = {
          MoveFocusOrTab = { _args = [ "Left" ]; };
        };
        "bind \"Alt j\"" = {
          MoveFocus = { _args = [ "Down" ]; };
        };
        "bind \"Alt k\"" = {
          MoveFocus = { _args = [ "Up" ]; };
        };
        "bind \"Alt l\"" = {
          MoveFocusOrTab = { _args = [ "Right" ]; };
        };
      };
    };
  };
}
