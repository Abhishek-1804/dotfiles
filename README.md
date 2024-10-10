# Dotfiles Repository

This repository contains all the necessary configuration files and scripts to set up a development environment on macOS, using `nix-darwin` and `home-manager` for declarative management of system and user-level configurations. It includes settings for Zsh, Neovim, Tmux, Starship, and other essential tools, eliminating the need for manual setup.

## Prerequisites

Ensure you have administrative access to your machine, with `nix` installed and configured for macOS.

## Installation Flow

Follow these steps to replicate this setup:

### 1. Clone the Dotfiles Repository

Start by cloning this repository into your home directory:

```bash
git clone <repository-url> ~/dotfiles
```

### 2. Install `nix-darwin` and `home-manager`

Before you begin, ensure that you have administrative access to your machine and a stable internet connection for downloading necessary packages.

Make sure `nix-darwin` and `home-manager` are installed on your system. You can find installation instructions for `nix-darwin` [here](https://github.com/LnL7/nix-darwin) and for `home-manager` [here](https://nix-community.github.io/home-manager/).

Video guides:

- nix-darwin: [Watch this video for detailed instructions](https://www.youtube.com/watch?v=Z8BL8mdzWHI)
- home-manager: [Watch this video for detailed instructions](https://www.youtube.com/watch?v=k9yKm_k5cVA)

### 3. Apply the Configuration

Once `nix-darwin` and `home-manager` are installed, apply the configurations by running the following command:

```bash
darwin-rebuild switch --flake ~/dotfiles/nix/darwin#Abhisheks-MacBook-Air
```

This command will apply both system-level (`nix-darwin`) and user-level (`home-manager`) configurations, ensuring that all packages, tools, and settings are automatically managed.

### 4. Managing Dotfiles with `home-manager`

All dotfiles in this repository are managed declaratively through `home-manager`, making it easy to version control and apply configurations across different environments. If you make changes to your dotfiles, simply update the relevant `.nix` files and run the rebuild command to apply them.

### 5. Customization

Feel free to modify the configurations and scripts as needed. All changes should be made in the `.nix` files under the `nix` directory, and applied via the `darwin-rebuild` command.

## Backup and Version Control

By managing your dotfiles declaratively with `nix-darwin` and `home-manager`, your entire system configuration is stored in version control. This ensures that your setup is reproducible across different machines.

## Contributions

Contributions to this repository are welcome. Please fork the repository and submit a pull request with your improvements.

## License

This dotfiles repository is made available under the MIT License. Please see the LICENSE file in this repository for the full text.
