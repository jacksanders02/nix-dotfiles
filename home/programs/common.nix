{ pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    
    # Archives
    zip
    unzip
    
    # Handy utilities
    eza # ls replacement
    ripgrep # Recursive search
    which
    zoxide # Better cd

    # Monitoring
    btop # Better htop
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
