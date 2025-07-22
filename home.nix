{ config, pkgs, ... }:

{
  home.username = "jacksanders";
  home.homeDirectory = "/home/jacksanders";

  # link all files . `.scripts` to `~/example/scripts`
  # home.file."example/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # Link recursively
  #   executable = true;  # Make all files executable
  # };

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

  programs.git = {
    enable = true;
    userName = "Jack Sanders";
    userEmail = "personal@jacksanders.uk";
  };
  
  programs.zoxide.enable = true;
  
  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;   
 
    shellAliases = {
      # General aliases
      cd = "z";
      ll = "eza -l -a --icons --group-directories-first";

      # Git aliases
      gpsh = "git push origin";
      gpll = "git pull origin";
    };

    history.ignoreAllDups = true;
  
    antidote = {
      enable = true;
      plugins = [
        "MichaelAquilina/zsh-you-should-use"
        "sindresorhus/pure"
      ];
    };

  };

  home.stateVersion = "25.05";
}
