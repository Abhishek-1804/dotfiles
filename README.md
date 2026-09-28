# dotfiles

Personal dotfiles, applied with [`mise bootstrap`](https://mise.jdx.dev/bootstrap.html).
Everything is declared in `mise.toml`; the files themselves live in `home/`.

| Source | Target | Mode |
|---|---|---|
| `home/gitconfig` | `~/.gitconfig` | template (vars in `mise.toml`) |
| `home/atuin/config.toml` | `~/.config/atuin/config.toml` | symlink |
| `home/starship.toml` | `~/.config/starship.toml` | symlink |

OS-specific setup lives in `mise.<env>.toml` and is selected with `-E`. `mise.omarchy.toml`
installs the packages added on top of stock Omarchy (pacman + AUR).

## Setup

```sh
git clone https://github.com/Abhishek-1804/dotfiles.git ~/dotfiles
cd ~/dotfiles
mise trust
mise -E omarchy bootstrap --dry-run
mise -E omarchy bootstrap --force-dotfiles   # first run: replaces existing target files
```

## Day to day

Symlinked files are edited in place (`~/.config/...` is the repo file), so just commit.
The gitconfig is rendered, so edit `home/gitconfig` and re-apply:

```sh
mise dot status           # what's applied / drifted
mise dot diff             # show pending changes
mise dot apply            # apply dotfiles only
mise -E omarchy bootstrap plan   # declarative plan (packages + dotfiles)
```

## Manual steps

- GitHub SSH key:

  ```sh
  ssh-keygen -t ed25519 -C "your_email@example.com"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
  cat ~/.ssh/id_ed25519.pub        # paste into github.com/settings/keys
  ssh -T git@github.com            # verify
  ```
