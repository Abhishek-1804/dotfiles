{
  description = "Top Level Darwin System Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager }:
    let
    configuration = { pkgs, config, ... }: {

# Allow proprietary software
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = pkgs.callPackage ../shared/modules/packages-cli.nix {} ++ [
          pkgs.mkalias
          pkgs.openssl
          pkgs.mas
      ];

# Homebrew
      homebrew = {
        enable = true;

        brews = [
            "gnu-sed"
            "xleak"
            "llvm@17"
            "luarocks"
            "container-compose"
            "lazycontainer"
            "transmission-cli"
            "watch"
            "yt-dlp"
            "btop"
        ];

        casks = [
            "adobe-acrobat-reader"
            "arc"
            "android-studio"
            "boosteroid"
            "chatgpt"
            "nikitabobko/tap/aerospace"
            "claude"
            "container"
            "cursor"
            "discord"
            "dockey"
            "utm"
            "ghostty"
            "google-chrome"
            "google-drive"
            "intellij-idea"
            "plex-media-server"
            "lm-studio"
            "logi-options+"
            "microsoft-excel"
            "microsoft-powerpoint"
            "microsoft-teams"
            "microsoft-word"
            "notion"
            "obs"
            "orbstack"
            "postman"
            "raycast"
            "slack"
            "stats"
            "steam"
            "surfshark"
            "vivaldi"
            "vlc"
            "webstorm"
            "whatsapp"
            "windsurf"
            "zoom"
            ];

        onActivation.cleanup = "uninstall";
        onActivation.autoUpdate = true;
        onActivation.upgrade = true;

        masApps = {
          "Amphetamine" = 937984704;
          "iMovie" = 408981434;
          "Tap Bot" = 6444782835;
          "DaVinci Resolve" = 571213070;
        };
      };

# Fonts
      fonts.packages = [
        pkgs.nerd-fonts.jetbrains-mono
      ];

# Spotlightable Nix apps via aliases
      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = [ "/Applications" ];
        };
      in pkgs.lib.mkForce ''
# Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read -r src; do
          app_name=$(basename "$src")
            echo "copying $src" >&2
            ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
            done
            '';

# macOS defaults
      system.defaults = {
        dock.autohide = true;
        dock.persistent-apps = [
            "System/Applications/App Store.app"
            "System/Applications/FaceTime.app"
            "System/Applications/System Settings.app"
            "System/Applications/FindMy.app"
            "System/Applications/Messages.app"
            "System/Applications/Passwords.app"
            "/Applications/Safari.app"
            "/Applications/Arc.app"
            "/Applications/WhatsApp.app"
            "/Applications/Notion.app"
            "/Applications/Ghostty.app"
            "/Applications/Wispr Flow.app"
            "/System/Applications/Utilities/Activity Monitor.app"
            "/System/Applications/iPhone Mirroring.app"
        ];
        loginwindow.GuestEnabled = false;
        finder.FXPreferredViewStyle = "clmv";
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
        NSGlobalDomain.KeyRepeat = 2;
      };

      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToControl = true;

# Touch ID for sudo
      security.pam.services.sudo_local.touchIdAuth = true;

# nix-darwin now manages nix-daemon when nix.enable = true
      nix.enable = true;

      nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
        trusted-users = [ "root" "abhishekdeshpande" ];
        substituters = [
          "https://cache.nixos.org"
            "https://nix-community.cachix.org"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      };

      nix.gc = {
        automatic = true;
        options = "--delete-older-than 7d";
      };

      nix.optimise.automatic = true;

# Shells
      programs.zsh.enable = true;  # create /etc/zshrc that sources nix-darwin env
        users.users.abhishekdeshpande.shell = pkgs.zsh;

# Version stamp for darwin-version
      system.configurationRevision = self.rev or self.dirtyRev or null;

# Darwin module state version
      system.stateVersion = 5;

# Platform
      nixpkgs.hostPlatform = "aarch64-darwin";

# Primary user
      system.primaryUser = "abhishekdeshpande";

# User home
      users.users.abhishekdeshpande.home = "/Users/abhishekdeshpande";
    };
  in
  {
# Build with:
# darwin-rebuild build --flake .#Personal
    darwinConfigurations = {
      "Personal" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                enableRosetta = true;
                user = "abhishekdeshpande";
                autoMigrate = true;
              };
            }
        home-manager.darwinModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.abhishekdeshpande = import ./profiles/personal/home.nix;
        }
        ];
      };
    };

# Expose package set for convenience
    darwinPackages = self.darwinConfigurations."Personal".pkgs;
  };
}
