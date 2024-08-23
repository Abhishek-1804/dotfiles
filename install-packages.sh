#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" &>/dev/null
}

# Install Homebrew if not installed
if ! command_exists brew; then
  echo "Homebrew not installed. Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew..."
brew update

# List of Homebrew packages to install
## Use 'brew leaves' to list all top-level packages
## Use 'brew list --cask' to list all casks
PACKAGES=(
  bat
  cmatrix
  fd
  fzf
  fdupes
  gnu-sed
  htop
  ipython
  jupyterlab
  lazygit
  make
  mongodb/brew/mongodb-community
  neofetch
  neovim
  openblas
  openssl@1.1
  python-gdbm@3.11
  python-tk@3.11
  rig
  ripgrep
  rust
  sl
  starship
  stow
  teamookla/speedtest/speedtest
  tmux
  tldr
)

echo "Installing Homebrew packages..."
for package in "${PACKAGES[@]}"; do
  if ! brew list "$package" &>/dev/null; then
    echo "Installing $package..."
    brew install "$package"
  else
    echo "$package is already installed"
  fi
done

# List of Homebrew casks to install
CASKS=(
  iterm2
)

echo "Installing Homebrew casks..."
for cask in "${CASKS[@]}"; do
  if ! brew list --cask "$cask" &>/dev/null; then
    echo "Installing $cask..."
    brew install --cask "$cask"
  else
    echo "$cask is already installed"
  fi
done

# Install Oh-My-Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh-My-Zsh not installed. Installing Oh-My-Zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh-My-Zsh is already installed"
fi

# Setup permissions for .config folder
echo "Setting admin permissions for .config folder..."
sudo chown -R $USER:admin $HOME/.config
sudo chmod -R 755 $HOME/.config

# Setup Neovim
if [ ! -d "$HOME/.config/nvim" ]; then
  echo "Setting up Neovim..."
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
else
  echo "A Neovim config is already present"
fi

# Install tmux plugin manager
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing tmux plugin manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "tmux plugin manager is already installed"
fi

echo "Installation complete."
