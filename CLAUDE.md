# CLAUDE.md

Personal dotfiles managed by `mise bootstrap` (not chezmoi; the old chezmoi repo is gone).

- `mise.toml` declares everything: `[vars]` (template data), `[dotfiles]` (target → source),
  `[bootstrap.packages]` (pacman). Sources live under `home/`.
- Plain `[dotfiles]` entries are symlinks into this repo. `~/.gitconfig` uses
  `mode = "template"`: Tera syntax (`{{ vars.name }}`), rendered as a copy, so re-run
  `mise dot apply` after editing `home/gitconfig`.
- Preview before applying: `mise bootstrap --dry-run`, `mise bootstrap plan`, `mise dot diff`.
- Target machine is Omarchy (Arch, bash). Don't add `[bootstrap.mise_shell_activate]`
  (Omarchy's bashrc already activates mise) or `[bootstrap.user]` shell changes, and don't
  manage `~/.bashrc` wholesale. `home/starship.toml` replaces Omarchy's own prompt config.
