{ pkgs, ... }:

let
# import the essentials-gui list
essentials-gui = import ./essentials-gui.nix { inherit pkgs; };
in

essentials-gui ++ [
  # Extended GUI Applications
  # Add additional GUI apps for complete profiles
  # Examples: pkgs.raycast, pkgs.obsidian, etc.
  pkgs.raycast
]
