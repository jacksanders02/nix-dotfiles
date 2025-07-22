{ config, ... }:

{
  imports = [
    ./zsh.nix
  ]; 
  
  home.shellAliases = {
    # General aliases
    cd = "z";
    ll = "eza -l -a --icons --group-directories-first";

    # Git aliases
    gpsh = "git push origin";
    gpll = "git pull origin";
  };
}
