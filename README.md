# Dotfiles Repository

This repository contains all the necessary dotfiles and scripts to set up a development environment. It includes configurations for Zsh, Neovim, Tmux, Starship, and other essential tools, managed through Homebrew and GNU Stow.

## Prerequisites

Before you begin, ensure that you have administrative access to your machine and a stable internet connection for downloading necessary packages.

## Installation Flow

Follow these steps to replicate the development environment:

### 1. Clone the Dotfiles Repository

Start by cloning this repository into the `dotfiles` directory in your home folder:

```bash
git clone <repository-url> ~/dotfiles
```

### 2. Install Required Packages with Homebrew

Run the brew-packages.sh script to install all necessary software via Homebrew. This script will check for the presence of Homebrew and install it if it's not already installed.

```bash
source brew-packages.sh
```

### 3. Install Oh-My-Zsh

Install Oh-My-Zsh, which will automatically create a new .zshrc file in your home directory. If you already have a .zshrc file, Oh-My-Zsh will rename it (usually to .zshrc.pre-oh-my-zsh).

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 4. Setup Neovim

Ensure Neovim is installed via the brew-packages.sh script. Install LazyVim into .config.

### 5. Setup Tmux

Ensure Tmux is installed via the brew-packages.sh script. Run the .tmux.conf file to apply the settings.

### 6. Setup Starship

Starship is also installed via the brew-packages.sh script. Configurations will be applied on sourcing the zshrc file.

### 7. Run Dotfiles Setup Script

Finally, execute the dotfiles-setup.sh script to symlink all configuration files from the ~/dotfiles directory to your home directory. This script will remove any conflicting existing configuration files in your home directory.

## Post Installation

After completing the setup, open a new terminal window to see the changes in effect. You might need to restart your terminal or your machine to ensure all configurations are properly loaded.

## Customization

Feel free to modify the configurations and scripts according to your personal preferences or specific needs.

## Backup

Always ensure you have backups of your current configurations before you run this setup to avoid accidental loss of personal settings.

## Contributions

Contributions to this repository are welcome. Please fork the repository and submit a pull request with your improvements.

## License

This dotfiles repository is made available under the "MIT License". Please see the LICENSE file in this repository for the full text.
