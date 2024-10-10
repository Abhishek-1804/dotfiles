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

  outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, home-manager}:
  let
    configuration = { pkgs, config, ... }: {

      # Allowing proprietary software download
      nixpkgs.config.allowUnfree = true;

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
            # CLI tools
            pkgs.mkalias
            pkgs.bat
            pkgs.btop
            pkgs.cmatrix
            pkgs.fastfetch
            pkgs.fd
            pkgs.fdupes
            pkgs.ffmpeg
            pkgs.fzf
            pkgs.hping
            pkgs.lazygit
            pkgs.neovim
            pkgs.nginx
            pkgs.nmap
            pkgs.ollama
            pkgs.jdk
            pkgs.openssl
            pkgs.transmission_4
            pkgs.pnpm
            pkgs.postgresql_14
            pkgs.ripgrep
            pkgs.sl
            pkgs.stow
            pkgs.starship
            pkgs.tlrc
            pkgs.tmux
            pkgs.tree
            pkgs.yt-dlp
            pkgs.yarn

            # Gui applications
            pkgs.iterm2
            pkgs.arc-browser
            pkgs.raycast
            pkgs.postman
            pkgs.zoom-us
            pkgs.pgadmin4
            pkgs.vscode
        ];

      # Homebrew stuff
      homebrew = {
          enable = true;
          brews = [
            "gnu-sed"
            "llvm@17"
            "luarocks"
            "make"
            "mas"
            "python-gdbm@3.11"
            "python-tk@3.12"
            "rust"
            "watch"
          ];
          casks = [
              "docker"
              "chatgpt"
              "google-drive"
              "miniforge"
              "notion"
              "surfshark"
              "whatsapp"
          ];
          onActivation.cleanup = "zap";
          onActivation.autoUpdate = true;
          onActivation.upgrade = true;
        };

        # Font config
        fonts.packages = [
          (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
        ];

      # To find applications installed from nixpkgs in spotlight search
      system.activationScripts.applications.text = let
        env = pkgs.buildEnv {
          name = "system-applications";
          paths = config.environment.systemPackages;
          pathsToLink = "/Applications";
        };
      in
        pkgs.lib.mkForce ''
        # Set up applications.
        echo "setting up /Applications..." >&2
        rm -rf /Applications/Nix\ Apps
        mkdir -p /Applications/Nix\ Apps
        find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
        while read src; do
          app_name=$(basename "$src")
          echo "copying $src" >&2
          ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done
      '';

      # Mac system default settings
      system.defaults = {
          dock.autohide = true;
          dock.persistent-apps = [
            "System/Applications/Mail.app"
            "System/Applications/Music.app"
            "System/Applications/App Store.app"
            "System/Applications/FaceTime.app"
            "System/Applications/System Settings.app"
            "System/Applications/Reminders.app"
            "System/Applications/Notes.app"
            "System/Applications/FindMy.app"
            "System/Applications/Messages.app"
            "System/Applications/Passwords.app"
            "/Applications/Safari.app"
            "${pkgs.arc-browser}/Applications/Arc.app"
            "/Applications/Google Chrome.app"
            "/Applications/WhatsApp.app"
            "/Applications/ChatGPT.app"
            "/Applications/Discord.app"
            "/Applications/Notion.app"
            "${pkgs.iterm2}/Applications/iTerm2.app"
            "/System/Applications/Utilities/Activity Monitor.app"
            "/Applications/Surfshark.app"
            "/Applications/UTM.app"
            "/Applications/Docker.app"
            "/System/Applications/iPhone Mirroring.app"
            "${pkgs.zoom-us}/Applications/zoom.us.app"
          ];
          loginwindow.GuestEnabled = false;
          finder.FXPreferredViewStyle = "clmv";
          NSGlobalDomain.AppleInterfaceStyle = "Dark";
          NSGlobalDomain.KeyRepeat = 2;
        };

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true;  # default shell on catalina
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      users.users.abhishekdeshpande.home = "/Users/abhishekdeshpande";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#Abhisheks-MacBook-Air
    darwinConfigurations."Abhisheks-MacBook-Air" = nix-darwin.lib.darwinSystem {
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
            home-manager.users.abhishekdeshpande = import ./home.nix;
          }
        ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."Abhisheks-MacBook-Air".pkgs;
  };
}
