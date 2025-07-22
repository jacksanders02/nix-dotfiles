{ config, ... }:

{
  programs.zoxide.enable = true;

  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;   
 
    history.ignoreAllDups = true;
  
    antidote = {
      enable = true;
      plugins = [
        "MichaelAquilina/zsh-you-should-use"
        "sindresorhus/pure"
      ];
    };
  };
}
