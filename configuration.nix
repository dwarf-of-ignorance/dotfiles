{ config, pkgs, ... }:

{
  imports =
    [ 
    ./hardware-configuration.nix
    ];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
  networking.networkmanager.enable = true;

# Set your time zone.
  time.timeZone = "Asia/Kolkata";

# Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };


# Enable the X11 windowing system.
  services.xserver.enable = true;

# Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
# Configure keymap in X11
  services.xserver= {
    xkb.layout = "us";
    xkb.variant = "";
  };

# Enable CUPS to print documents.
  services.printing.enable = true;

# Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.ideal = {
    isNormalUser = true;
    description = "ideal";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };
  services.xserver.excludePackages = [ pkgs.xterm ];
  programs.nano.enable = false;
  nixpkgs.config.allowUnfree = true;

# Disable core utils of gnome(remove if you want default gnome apps)
  services.gnome.core-utilities.enable = false;

# List packages installed in system profile.
  environment.systemPackages = with pkgs; [
# gnome extentions
    gnomeExtensions.simple-net-speed
#command line tool
      git
      neovim
      ripgrep
      thefuck
      tldr
      xclip
      curl
      yazi
      zip
      wget
      unzip
      neofetch
      gh
      tmux
#development
      go
      zulu17
      python3
      python312Packages.pip
      R
      nodejs_21
      flutter
      dart
      luajitPackages.luarocks-nix
      libgcc
      libgccjit
      rocmPackages.llvm.clang
      rustc
      cargo
# gui application
      vlc
      floorp
      gimp
      wezterm
      vlc
      gnome.gnome-tweaks
#customization

# shells
      oh-my-zsh
      zsh
      ];

  fonts.packages = with pkgs; [
    noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      jetbrains-mono
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  }; 
  programs = {
    zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
	enable = true;
	theme = "agnoster";
	plugins = [

	];
      };
    };
  };
  programs.zsh.shellAliases = {
    nix-config = "sudoedit /etc/nixos/configuration.nix";
    vi = "nvim";

  };

  users.defaultUserShell = pkgs.zsh;
# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
