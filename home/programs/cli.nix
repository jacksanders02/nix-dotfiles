{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    
    # Archives
    zip
    unzip
    
    # Handy system utils
    du-dust # ncdu alternative?
    duf # Free space finder
    eza # ls replacement
    fd # Faster 'find'
    file # Find type of files
    ncdu
    ripgrep # Recursive search
    which
    zoxide # Better cd

    # Fun utils
    meteor-git # Tool for writing conventional commits

    # Monitoring
    btop # Better htop
    
    # Dependencies
    libnotify
    fontconfig
  ];

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      extraConfig = "mouse on";
    };

    btop.enable = true;
    eza.enable = true;
    ssh.enable = true;
    zoxide.enable = true;
  };
}
