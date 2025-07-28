{ config, ... }:

{
  imports = [
    ./zsh.nix
    ./kitty.nix
  ]; 
  
  home.shellAliases = {
    # General aliases
    cd = "z";
    ll = "eza -l -a --icons --group-directories-first";
    edit = "gnome-text-editor";

    # Git aliases from omz
    g = "git";
    ga = "git add";
    gb = "git branch";
    gc = "git commit -v";
    gco = "git checkout";
    gcl = "git clone --recurse-submodules";
    gcp = "git cherry-pick";
    gd = "git diff";
    gf = "git fetch";
    glg = "git log --stat";
    gm = "git merge";
    gr = "git remote";
    gra = "git remote add";
    grb = "git rebase";
    grh = "git reset";
    grhh = "git reset --hard";
    grm = "git rm";
    grst = "git restore --staged";
    gst = "git status";

    # Custom git aliases
    gpsh = "git push origin";
    gpll = "git pull origin";
  };
}
