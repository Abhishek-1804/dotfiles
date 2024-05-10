#!/bin/bash

# Checking if Homebrew is installed
if ! command -v brew &>/dev/null; then
	echo "Homebrew not installed. Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Updating Homebrew..."
brew update

# List of Homebrew packages to install
PACKAGES=(
	fd
	python
	lua
	node
	make
	neovim
	ripgrep
	rust
	sqlite
	starship
	stow
	tmux
	tree-sitter
)

echo "Installing Homebrew packages..."
for package in "${PACKAGES[@]}"; do
	echo "Installing $package..."
	brew install "$package"
done

# List of Homebrew casks to install
CASKS=(
	iterm2
	docker
	spotify
	warp
)

echo "Installing Homebrew casks..."
for cask in "${CASKS[@]}"; do
	echo "Installing $cask..."
	brew install --cask "$cask"
done

echo "Installation complete."
