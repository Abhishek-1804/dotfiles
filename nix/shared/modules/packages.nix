{ pkgs, ... }:

[
# Programming Languages and Development Tools
  pkgs.neovim
  pkgs.nodejs
  pkgs.python3
  pkgs.python312Packages.tkinter
  pkgs.rustc
  pkgs.cargo
  pkgs.go
  pkgs.jdk
  pkgs.bun
  pkgs.pnpm
  pkgs.yarn
  pkgs.deno
  pkgs.gcc
  pkgs.cmake
  pkgs.libuv
  pkgs.zlib

# Networking and Security Tools
  pkgs.nginx
  pkgs.nmap
  pkgs.hping
  pkgs.gping
  pkgs.hashcat
  pkgs.speedtest-rs
  pkgs.curl
  pkgs.wget

# CLI Utilities and System Tools
  pkgs.bat
  pkgs.fastfetch
  pkgs.fd
  pkgs.ripgrep
  pkgs.fdupes
  pkgs.fzf
  pkgs.tree
  pkgs.stow
  pkgs.lazygit
  pkgs.lazydocker
  pkgs.tlrc
  pkgs.hwloc
  pkgs.yazi

# Random Cool Tools
  pkgs.sl
  pkgs.cmatrix
  pkgs.hollywood

# Media and Content Tools
  pkgs.ffmpeg
  pkgs.hugo

# Specialized Tools
  pkgs.ollama
  ]

