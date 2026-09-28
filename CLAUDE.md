# CLAUDE.md

Personal dotfiles managed by `mise bootstrap` (not chezmoi; the old chezmoi repo is gone).

- `mise.toml` holds shared setup: `[vars]` (template data) and `[dotfiles]` (target → source).
  Sources live under `home/`. OS-specific setup goes in `mise.<env>.toml`, selected with `-E`:
  `mise.omarchy.toml` has the pacman `[bootstrap.packages]`. Never put `brew:` entries in the shared
  `mise.toml`: on Linux mise installs Linuxbrew to satisfy them.
- Plain `[dotfiles]` entries are symlinks into this repo. `~/.gitconfig` uses
  `mode = "template"`: Tera syntax (`{{ vars.name }}`), rendered as a copy, so re-run
  `mise dot apply` after editing `home/gitconfig`.
- Preview before applying: `mise -E omarchy bootstrap --dry-run`, `mise bootstrap plan`, `mise dot diff`.
- Target machine is Omarchy (Arch, bash). Don't add `[bootstrap.mise_shell_activate]`
  (Omarchy's bashrc already activates mise) or `[bootstrap.user]` shell changes, and don't
  manage `~/.bashrc` wholesale. `home/starship.toml` replaces Omarchy's own prompt config.
