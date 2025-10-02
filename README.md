# Dotfiles: Fully Declarative Nix Setup (macOS & Linux)

This repository contains all configuration files and scripts to bootstrap a reproducible development environment using Nix, nix-darwin, and Home Manager.
It manages your shell, editors, terminal, packages, and more—declaratively and cross-platform.

---

## Features

- Cross-platform: works for both macOS (via nix-darwin) and Linux (Home Manager)
- Modular, flake-based structure for easy extensibility
- All config files and dotfiles managed with Home Manager
- Package management through Nix + optional Homebrew integration (on macOS)
- Fast onboarding for new machines or reinstalls

---

## Quick Start

### 1. Prerequisites

- macOS Monterey/12 or later, or Linux
- Nix installed with flakes enabled
- Administrative access

To enable flakes:

- `mkdir -p ~/.config/nix`
- `echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf`

---

### 2. Clone the Repository

`git clone https://github.com/Abhishek-1804/dotfiles.git ~/dotfiles`

---

### 3. For macOS (nix-darwin)

1. Install nix-darwin (see: <https://github.com/LnL7/nix-darwin>)
2. Install Home Manager (if not already included)
3. Apply the config:

`darwin-rebuild switch --flake ~/dotfiles/nix/darwin#Personal`

Or, replace "Personal" with your chosen profile/hostname if you have more than one.

---

### 4. For Linux (Home Manager only)

1. Install Home Manager:
   See: <https://nix-community.github.io/home-manager/index.html#sec-install-standalone>

2. Apply your profile:

`home-manager switch --flake ~/dotfiles/nix/linux#personal`

Or use "#minimal" for a lighter setup.

---

## Structure Overview

```
dotfiles/
├── nix/
│ ├── darwin/ # macOS-specific Nix/darwin config
│ │ ├── flake.nix
│ │ └── profiles/
│ ├── linux/ # Linux-specific Home Manager config
│ │ ├── flake.nix
│ │ └── profiles/
│ └── shared/ # Common Home Manager modules for both OSes
└── .config/ # Actual config files for editors, terminals, etc
```

All app config is managed in .config/ and symlinked by Home Manager.
Packages and utilities are split between essential and optional modules for flexibility.

---

## Customization

Edit the .nix files under nix/ to add/remove packages, tweak dotfiles, or change settings.
Add your own modules in nix/shared/ for additional tools or workflows.

---

## Updating Configurations

Whenever you change any .nix or .config files, just run the appropriate command:

# On macOS

`darwin-rebuild switch --flake ~/dotfiles/nix/darwin#Personal`

# On Linux

`home-manager switch --flake ~/dotfiles/nix/linux#personal`

---

## Updates and Maintenance

Occasionally, manually run these maintenance commands:

- **Update flake inputs:**
  `nix flake update`
  Updates flake inputs like nixpkgs to latest versions

- **Aggressive cleanup:**
  `nix-collect-garbage -d`
  Deletes old generations + removes unreachable store paths - most aggressive cleanup

- **Optimize store:**
  `nix store optimise`
  Deduplicates identical files using hard links to save 25-35% disk space

- **Verify integrity:**
  `nix store verify`
  Verifies store path integrity and cryptographic signatures

- **Health check:**
  `nix doctor`
  Runs system health checks with PASS/FAIL diagnostics

## Troubleshooting & Tips

- If you get a "conflicting definition" error, ensure home.username and home.homeDirectory are not set in multiple places.
  - On macOS/darwin: These are set by the system—do NOT set them in your Home Manager home.nix.
  - On Linux: They can be set using builtins.getEnv.
- For more profiles (work, minimal, etc), copy/modify the profile directories and edit your flake configs accordingly.
- .DS_Store and other OS artifacts should be added to .gitignore.

---

## Contributions

Contributions and suggestions welcome!
Fork the repo, make your changes, and submit a pull request.

---

## License

This repository is released under the MIT License. See the LICENSE file for details.

---

## References

- <https://nixos.org/>
- <https://github.com/LnL7/nix-darwin>
- <https://nix-community.github.io/home-manager/>
