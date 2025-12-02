# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a fully declarative Nix-based dotfiles repository that manages development environments across macOS (via nix-darwin) and Linux (via Home Manager). All configuration is version-controlled and reproducible.

## Building and Deploying

### macOS (nix-darwin)
```bash
# Apply configuration changes
darwin-rebuild switch --flake ~/dotfiles/nix/darwin#Personal

# Build without switching
darwin-rebuild build --flake ~/dotfiles/nix/darwin#Personal
```

### Linux (Home Manager)
```bash
# Apply personal CLI profile
home-manager switch --flake ~/dotfiles/nix/linux#personal-cli

# Apply complete profile (includes GUI apps)
home-manager switch --flake ~/dotfiles/nix/linux#complete

# Apply minimal profile
home-manager switch --flake ~/dotfiles/nix/linux#minimal
```

### Updating Dependencies
```bash
# Update flake inputs (run from nix/darwin or nix/linux directories)
nix flake update

# After updating, rebuild the configuration
```

### Maintenance Commands
```bash
# Aggressive cleanup - removes old generations and unreachable store paths
nix-collect-garbage -d

# Optimize store - deduplicates files using hard links (saves 25-35% disk space)
nix store optimise

# Verify store integrity
nix store verify --all

# System health check
nix config check
```

## Architecture

### Directory Structure
```
dotfiles/
├── nix/
│   ├── darwin/              # macOS-specific configuration
│   │   ├── flake.nix        # Main darwin flake with system config
│   │   └── profiles/        # User profiles
│   │       └── personal/
│   │           └── home.nix # Home Manager config for macOS
│   ├── linux/               # Linux-specific configuration
│   │   ├── flake.nix        # Linux flake with multiple profiles
│   │   └── profiles/        # Profile variants
│   │       ├── complete/    # Full CLI + GUI
│   │       ├── personal-cli/# CLI only
│   │       └── minimal/     # Essential packages only
│   └── shared/              # Cross-platform Home Manager modules
│       ├── modules/
│       │   ├── essentials.nix  # Core CLI utilities
│       │   └── packages.nix    # Extended package set
│       └── *.nix            # Program-specific configs (zsh, neovim, etc.)
└── .config/                 # Actual dotfiles symlinked by Home Manager
```

### Key Design Patterns

**Two-Layer Package Management:**
- `essentials.nix`: Core CLI tools (git, nodejs, python, rust, fzf, ripgrep, etc.)
- `packages.nix`: Extended tools (imports essentials + adds dev tools, cloud, containers)
- Home profiles can extend further with profile-specific packages

**Program Configuration:**
- Shared program configs in `nix/shared/` (neovim.nix, zsh.nix, tmux.nix, etc.)
- Imported by profile `home.nix` files
- Actual config files live in `.config/` and are symlinked via `home.file`

**Profile Inheritance:**
- macOS: Single "Personal" profile manages both system (darwin) and user (Home Manager)
- Linux: Multiple profiles (minimal/personal-cli/complete) for different use cases
- All profiles share the same program configurations from `shared/`

**macOS-Specific Features:**
- Homebrew integration via nix-homebrew (brews, casks, Mac App Store apps)
- System defaults (dock, keyboard, finder settings)
- Application aliasing to Spotlight via mkalias
- Touch ID for sudo authentication

## Making Changes

### Adding Packages

**For CLI tools shared across platforms:**
Edit `nix/shared/modules/essentials.nix` or `packages.nix`

**For macOS-specific packages:**
- Nix packages: Add to `environment.systemPackages` in `nix/darwin/flake.nix`
- Homebrew formulae: Add to `homebrew.brews` array
- Homebrew casks: Add to `homebrew.casks` array
- Mac App Store: Add to `homebrew.masApps` with app ID

**For profile-specific packages:**
Add to `home.packages` in the appropriate profile's `home.nix`

### Adding Program Configurations

1. Create new module in `nix/shared/myprogram.nix`
2. Import in profile `home.nix` files: `programs.myprogram = (import ../../../shared/myprogram.nix { inherit config pkgs; });`
3. Add actual config files to `.config/myprogram/`

### Modifying System Defaults (macOS)

Edit the `system.defaults` section in `nix/darwin/flake.nix`. See nix-darwin documentation for available options.

## Important Notes

**Home Manager User Variables:**
- On macOS: NEVER set `home.username` or `home.homeDirectory` in home.nix (set by darwin system)
- On Linux: Use `builtins.getEnv "USER"` and `builtins.getEnv "HOME"`

**Config File Management:**
- The `.config/` directory is recursively symlinked via `home.file`
- Changes to configs require a rebuild to take effect
- Use `force = true` in home.file to override existing files

**Homebrew (macOS):**
- `onActivation.cleanup = "uninstall"` removes packages not in config
- Auto-update and upgrade enabled on activation
- Requires nix-homebrew with Rosetta enabled for compatibility

**Flake Inputs:**
- All flakes follow nixpkgs-unstable for latest packages
- Home Manager inputs follow the same nixpkgs to avoid conflicts
- Run `nix flake update` periodically to get security updates

## Testing Changes

After modifying any `.nix` files, always test before committing:

1. Run the appropriate rebuild command for your platform
2. Verify the build completes without errors
3. Check that expected packages/configs are present
4. Test that shell and programs work as expected

## Common Patterns

**Finding package names:**
```bash
nix search nixpkgs <package-name>
```

**Checking what's installed:**
```bash
# macOS
nix-env -q
darwin-rebuild --list-generations

# Linux
home-manager packages
home-manager generations
```

**Rolling back:**
```bash
# macOS
darwin-rebuild --rollback

# Linux
home-manager --rollback
```
