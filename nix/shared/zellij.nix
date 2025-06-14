{ pkgs, ... }:

{
  enable = true;

  settings = {

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
