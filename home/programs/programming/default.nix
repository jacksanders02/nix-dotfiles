{ pkgs, ... }:

{
  imports = [
    ./vscode.nix
  ];
  
  # ==== Programming-Related Packages ==== #
  home.packages = with pkgs; [
  ];
}
