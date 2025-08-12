# SOURCE - https://github.com/HeitorAugustoLN/betterfox-nix

{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
}
