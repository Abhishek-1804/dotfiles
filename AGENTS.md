# AGENTS.md

## Build/Lint/Test Commands
- **Build Darwin system**: `darwin-rebuild build --flake ~/dotfiles/nix/darwin#Personal`
- **Switch Darwin system**: `darwin-rebuild switch --flake ~/dotfiles/nix/darwin#Personal`
- **Build Home Manager (Linux)**: `home-manager build --flake ~/dotfiles/nix/linux#personal`
- **Switch Home Manager**: `home-manager switch --flake ~/dotfiles/nix/linux#personal`
- **Run single test**: No tests defined; use `nix flake check` for flake validation.
- **Lint**: No linter configured; run `nixpkgs-fmt` on .nix files manually.

## Code Style Guidelines
- **Imports**: Use `inherit` for common args; absolute paths for modules.
- **Formatting**: Follow nixpkgs-fmt (2-space indent, no trailing spaces).
- **Types**: Use Nix types where possible (e.g., `types.str`).
- **Naming**: CamelCase for attrs, lowercase for vars; descriptive names.
- **Error Handling**: Use `assert` for preconditions; avoid silent failures.
- **Structure**: Modular flakes; shared modules for reusability.