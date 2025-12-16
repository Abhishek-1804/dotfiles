{ pkgs, ... }:

let
# import the essentials-cli list
# These packages mainly define CLI Utilities. GUI packages should be placed in GUI-specific modules
essentials-cli = import ./essentials-cli.nix { inherit pkgs; };
in

essentials-cli ++ [
# Programming Languages and Development Tools
  pkgs.jdk
  pkgs.bun
  pkgs.pnpm
  pkgs.yarn
  pkgs.deno
  pkgs.gradle_8
  pkgs.zlib

# Cloud
  pkgs.awscli2

# Containerization
  pkgs.kubectl
  pkgs.minikube
  pkgs.podman
  pkgs.podman-compose

# Networking and Security Tools
  pkgs.nginx
  pkgs.mtr
  pkgs.nmap
  pkgs.aria2
  pkgs.rsync
  pkgs.ngrok
  pkgs.speedtest-rs
  pkgs.hping
  pkgs.gping
  pkgs.hashcat

# CLI Utilities and System Tools
  pkgs.stow
  pkgs.hwloc
  pkgs.eza

# Random Cool Tools
  pkgs.fastfetch
  pkgs.sl
  pkgs.scc
  pkgs.cmatrix
  pkgs.cbonsai
  pkgs.asciiquarium
  pkgs.genact
  pkgs.asciinema
  pkgs.lolcat

# Media and Content Tools
  pkgs.ffmpeg
  pkgs.python312Packages.ffmpeg-progress-yield
  pkgs.hugo
  pkgs.croc

# Utilities
  pkgs.czkawka
  pkgs.fdupes
  pkgs.tldr

# AI Tools
  # pkgs.ollama
  pkgs.gemini-cli
  pkgs.opencode
  pkgs.claude-code
]
