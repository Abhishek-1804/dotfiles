{ pkgs, ... }:

let
# import the essentials list
essentials = import ./essentials.nix { inherit pkgs; };
in

essentials ++ [
# Programming Languages and Development Tools
  pkgs.jdk
  pkgs.bun
  pkgs.pnpm
  pkgs.yarn
  pkgs.deno
  pkgs.gradle_8
## super-fast source code line counter
  pkgs.scc
## general-purpose lossless data-compression library
  pkgs.zlib

# Cloud
  pkgs.awscli2

# Containerization
  pkgs.kubectl
  pkgs.minikube

# Networking and Security Tools
  pkgs.nginx
  pkgs.nmap
  pkgs.ngrok
## TCP/IP packet crafter and network testing tool
  pkgs.hping
## interactive ping utility with real-time graphs
  pkgs.gping
## GPU-accelerated password recovery and cracking tool
  pkgs.hashcat
  pkgs.speedtest-rs

# CLI Utilities and System Tools
  pkgs.stow
## hardware topology discovery and CPU/memory mapper
  pkgs.hwloc

# Random Cool Tools
  pkgs.fastfetch
  pkgs.sl
  pkgs.cmatrix
## generate fake activity logs for demos or testing
  pkgs.genact
## terminal session recorder for sharing CLI workflows
  pkgs.asciinema

# Media and Content Tools
  pkgs.ffmpeg
  pkgs.python312Packages.ffmpeg-progress-yield
  pkgs.hugo

# Specialized Tools
  pkgs.ollama
## AI-powered Fabric management and deployment toolkit
  pkgs.fabric-ai
  ]
