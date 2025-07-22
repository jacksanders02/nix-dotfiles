{pkgs, ...}: {
  imports = [
    ../../home/core.nix

    ../../home/programs
    ../../home/shell
  ];

  programs.git = {
    userName = "Jack Sanders";
    userEmail = "personal@jacksanders.uk";
  };
}
