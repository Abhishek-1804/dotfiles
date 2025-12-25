# Essentials-Only Dev Environment Setup (macOS)

Minimal dev environment for work/temporary laptops without Nix.

## Prerequisites

1. `xcode-select --install`
2. System Settings:
   - Remap Caps Lock → Control
   - Set Key Repeat to max
3. Install Homebrew

## Homebrew Packages

**Maintenance:**

```bash
brew update && brew upgrade
```

**brew leaves:**

- atuin, bat, btop, fastfetch, fd, fzf, lazygit, neovim, ripgrep, starship, stow, tlrc, zellij

**brew casks:**

- visual-studio-code, font-jetbrains-mono-nerd-font, ghostty, raycast

## Core Setup

4. Install Oh-My-Zsh
5. Install LazyVim
6. Track dotfiles using GNU Stow (`.files/` directory)

## Configs

### Raycast

- Settings → Extensions → Snippets
- Enable snippet expansion

### Ghostty (`~/.config/ghostty/config`)

```conf
window-subtitle = working-directory
window-decoration = true
window-padding-x = 1
window-padding-y = 1
background-opacity = 0.95
font-size = 13
font-family = MesloLGS Nerd Font Mono
mouse-hide-while-typing = true
macos-titlebar-style = transparent
macos-option-as-alt = true

# Claude Code integration
keybind = shift+enter=text:\x1b[13;2u
```

### Oh-My-Zsh (`~/.zshrc`)

```bash
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
```

Clone plugin repos: `zsh-syntax-highlighting`, `zsh-autosuggestions`

### Starship (`~/.zshrc`)

```bash
eval "$(starship init zsh)"
```

**Config (`~/.config/starship.toml`):**

```toml
format = """
[](surface0)\
$os\
$username\
[](bg:peach fg:surface0)\
$directory\
[](fg:peach bg:green)\
$git_branch\
$git_status\
[](fg:green bg:teal)\
$c\
$rust\
golang\
$nodejs\
$php\
$java\
$kotlin\
$haskell\
$python\
[](fg:teal bg:blue)\
$docker_context\
[](fg:blue bg:purple)\
$time\
[ ](fg:purple)\
$line_break$character"""

palette = 'catppuccin_mocha'

[palettes.gruvbox_dark]
color_fg0 = '#fbf1c7'
color_bg1 = '#3c3836'
color_bg3 = '#665c54'
color_blue = '#458588'
color_aqua = '#689d6a'
color_green = '#98971a'
color_orange = '#d65d0e'
color_purple = '#b16286'
color_red = '#cc241d'
color_yellow = '#d79921'

[palettes.catppuccin_mocha]
rosewater = "#f5e0dc"
flamingo = "#f2cdcd"
pink = "#f5c2e7"
orange = "#cba6f7"
red = "#f38ba8"
maroon = "#eba0ac"
peach = "#fab387"
yellow = "#f9e2af"
green = "#a6e3a1"
teal = "#94e2d5"
sky = "#89dceb"
sapphire = "#74c7ec"
blue = "#89b4fa"
lavender = "#b4befe"
text = "#cdd6f4"
subtext1 = "#bac2de"
subtext0 = "#a6adc8"
overlay2 = "#9399b2"
overlay1 = "#7f849c"
overlay0 = "#6c7086"
surface2 = "#585b70"
surface1 = "#45475a"
surface0 = "#313244"
base = "#1e1e2e"
mantle = "#181825"
crust = "#11111b"

[os]
disabled = false
style = "bg:surface0 fg:text"

[os.symbols]
Windows = "󰍲"
Ubuntu = "󰕈"
SUSE = ""
Raspbian = "󰐿"
Mint = "󰣭"
Macos = ""
Manjaro = ""
Linux = "󰌽"
Gentoo = "󰣨"
Fedora = "󰣛"
Alpine = ""
Amazon = ""
Android = ""
Arch = "󰣇"
Artix = "󰣇"
CentOS = ""
Debian = "󰣚"
Redhat = "󱄛"
RedHatEnterprise = "󱄛"

[username]
show_always = true
style_user = "bg:surface0 fg:text"
style_root = "bg:surface0 fg:text"
format = '[ $user ]($style)'

[directory]
style = "fg:mantle bg:peach"
format = "[ $path ]($style)"
truncation_length = 3
truncation_symbol = "…/"

[directory.substitutions]
"Documents" = "󰈙 "
"Downloads" = " "
"Music" = "󰝚 "
"Pictures" = " "
"Developer" = "󰲋 "

[git_branch]
symbol = ""
style = "bg:teal"
format = '[[ $symbol $branch ](fg:base bg:green)]($style)'

[git_status]
style = "bg:teal"
format = '[[($all_status$ahead_behind )](fg:base bg:green)]($style)'

[nodejs]
symbol = ""
style = "bg:teal"
format = '[[ $symbol( $version) ](fg:base bg:teal)]($style)'

[c]
symbol = " "
style = "bg:teal"
format = '[[ $symbol( $version) ](fg:base bg:teal)]($style)'

[rust]
symbol = ""
style = "bg:teal"
format = '[[ $symbol( $version) ](fg:base bg:teal)]($style)'

[golang]
symbol = ""
style = "bg:teal"
format = '[[ $symbol( $version) ](fg:base bg:teal)]($style)'

[php]
symbol = ""
style = "bg:teal"
format = '[[ $symbol( $version) ](fg:base bg:teal)]($style)'

[java]
symbol = " "
style = "bg:teal"
format = '[[ $symbol( $version) ](fg:base bg:teal)]($style)'

[kotlin]
symbol = ""
style = "bg:teal"
format = '[[ $symbol( $version) ](fg:base bg:teal)]($style)'

[haskell]
symbol = ""
style = "bg:teal"
format = '[[ $symbol( $version) ](fg:base bg:teal)]($style)'

[python]
symbol = ""
style = "bg:teal"
format = '[[ $symbol( $version) ](fg:base bg:teal)]($style)'

[docker_context]
symbol = ""
style = "bg:mantle"
format = '[[ $symbol( $context) ](fg:#83a598 bg:color_bg3)]($style)'

[time]
disabled = false
time_format = "%R"
style = "bg:peach"
format = '[[  $time ](fg:mantle bg:purple)]($style)'

[line_break]
disabled = false

[character]
disabled = false
success_symbol = '[](bold fg:green)'
error_symbol = '[](bold fg:red)'
vimcmd_symbol = '[](bold fg:creen)'
vimcmd_replace_one_symbol = '[](bold fg:purple)'
vimcmd_replace_symbol = '[](bold fg:purple)'
vimcmd_visual_symbol = '[](bold fg:lavender)'
```

### Atuin (`~/.zshrc`)

```bash
eval "$(atuin init zsh)"
```

**Config (`~/.config/atuin/config.toml`):**

```toml
# Local-only configuration (no cloud sync)
auto_sync = false
sync_address = ""
update_check = false

# UI
style = "auto"
enter_accept = true
theme = "autumn"

# Search
search_mode = "fuzzy"
filter_mode = "global"
filter_mode_shell_up_key_binding = "session"

# History
inline_height = 20
show_preview = true
max_preview_height = 4
```

**First time:** `atuin import auto`

### Zellij (`~/.config/zellij/config.kdl`)

```kdl
keybinds {
    shared_except "locked" {
        unbind "Ctrl g"
    }
}

// Set secondary modifier to Shift+Ctrl
simplified_ui true
default_mode "normal"
mouse_mode true
pane_frames false
theme "catppuccin-mocha"

// Modifier configuration
keybinds {
    normal {
        bind "Ctrl Shift" {
            // Secondary modifier bindings
        }
    }
}
```

## Final

```bash
source ~/.zshrc
```
