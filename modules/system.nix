{ pkgs, lib, username, inputs, ... }:

{
  # ==== User Setup ==== #
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };

  # ==== Nix Settings ==== #
  nix.settings = {
    # Enable flakes globally
    experimental-features = ["nix-command" "flakes"];
  };

  # Enable automatic garbage collection once a week
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # Enable automatic upgrades
  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "--print-build-logs"
    ];
    dates = "02:00";
    randomizedDelaySec = "45min";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # ==== Generic Linux Settings ==== #
  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # == Font Settings == #
  fonts = {
    packages = with pkgs; [
      # Icon fonts
      material-design-icons
      nerd-fonts.symbols-only
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka
    
      # Noto
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
    
      inter
    ];
  
    # Use user-defined fonts rather than defaults
    enableDefaultPackages = false;

    # User-defined fonts
    fontconfig.defaultFonts = {
      serif = ["Noto Serif" "Noto Color Emoji"];
      sansSerif = ["Inter" "Noto Sans" "Noto Color Emoji"];
      monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
      emoji = ["Noto Color Emoji"];
    };
  };

  # ==== OpenSSH Settings ==== #
  # Enable OpenSSH daemon
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
  
      # Disable root login and password authentication for better security
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
  };

  # ==== System Packages ==== #

  # Enable ZSH
  programs.zsh.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    git
    sysstat
    lm_sensors 
  ];

  environment.variables.EDITOR = "vim";

  # ==== System Services ==== #
  hardware.bluetooth.enable = true;
  services = {
    blueman.enable = true;
  
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  # ==== GTK Stuff ==== #
  programs.dconf.enable = true;

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
  system.stateVersion = "25.05"; # Did you read the comment?

}
