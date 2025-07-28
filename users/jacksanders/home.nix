{pkgs, ...}: {
  imports = [
    ../../home/core.nix

    ../../home/programs
    ../../home/shell
    ../../home/theming
  ];

  programs.git = {
    userName = "Jack Sanders";
    userEmail = "personal@jacksanders.uk";
  };
}
