#!/bin/zsh

# dotfiles-setup.sh
# This script sets up symlinks for dotfiles in the user's home directory.

# Directory where dotfiles are stored
DOTFILES_DIR="$(dirname "$0")"
HOME_DIR=$HOME

# Script file name (to be excluded from symlinking)
SCRIPT_FILE="$(basename "$0")"
# Additional file to exclude from symlinking
EXCLUDE_FILE="install-packages.sh"

# Function to remove conflicting files
remove_conflicts() {
    local relative_path="${1#$DOTFILES_DIR/}"
    local target="$HOME_DIR/$relative_path"

    # Skip if the target is the script file itself or the excluded file
    if [[ "$relative_path" == "$SCRIPT_FILE" || "$relative_path" == "$EXCLUDE_FILE" ]]; then
        return
    fi

    # Check if target exists and is not a symlink
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Removing conflicting file: $target"
        rm -rf "$target"
    fi
}

# Export the function so it's available in subshells
export -f remove_conflicts

# Use find to list all files and directories in the dotfiles directory, ignoring the .git directory and excluded files
find "$DOTFILES_DIR" -path "$DOTFILES_DIR/.git" -prune -o -type f -print | while read file; do
    remove_conflicts "$file"
done

# Run stow to symlink all packages, excluding specified files
echo "Running 'stow .' to create symlinks..."
stow --no-folding --verbose=2 --target="$HOME_DIR" --delete --restow --ignore="$SCRIPT_FILE" --ignore="$EXCLUDE_FILE" .

echo "Setup complete."
