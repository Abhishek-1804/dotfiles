{ pkgs, ... }:

[
  # Programming Languages and Development Tools
  pkgs.git
  pkgs.gh
  pkgs.nodejs
  pkgs.python3
  pkgs.uv
  pkgs.rustc
  pkgs.cargo
  pkgs.go
  pkgs.gcc
  pkgs.cmake
  pkgs.libuv

# # Containerization
#   pkgs.colima
#   pkgs.docker
#   pkgs.docker-compose
#   pkgs.docker-buildx
#   pkgs.docker-credential-helpers

  # CLI Utilities and System Tools
  pkgs.fdupes
  pkgs.bat
  pkgs.fd
  pkgs.duf
  pkgs.ripgrep
  pkgs.fzf
  pkgs.lazygit
  pkgs.lazydocker
  pkgs.tlrc
  pkgs.yazi
]
