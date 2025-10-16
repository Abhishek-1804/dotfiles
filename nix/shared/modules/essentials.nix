{ pkgs, ... }:

[
  # Programming Languages and Development Tools
  pkgs.git
  pkgs.nodejs
  pkgs.python3
  pkgs.uv
  pkgs.rustc
  pkgs.cargo
  pkgs.go
  pkgs.gcc
  pkgs.cmake
  ## cross-platform asynchronous I/O & event loop library
  pkgs.libuv

# # Containerization
#   pkgs.colima
#   pkgs.docker
#   pkgs.docker-compose
#   pkgs.docker-buildx
#   pkgs.docker-credential-helpers

  # Networking and Security Tools
  ## multi-protocol, high-speed command-line downloader
  pkgs.aria2
  pkgs.rsync

  # CLI Utilities and System Tools
  pkgs.fdupes
  pkgs.bat
  ## simple, fast, user-friendly alternative to `find`
  pkgs.fd
  ## friendly, colored output
  pkgs.duf
  pkgs.ripgrep
  pkgs.fzf
  # modern replacement for `ls` with Git & icons support
  pkgs.eza
  pkgs.lazygit
  pkgs.lazydocker
  pkgs.tlrc
  pkgs.yazi
]
