{username, ...}: {
  # Crucial home-manager config, common to all use-cases
  home = {
    inherit username;
    homeDirectory = "/home/${username}";

    # Ensure safe home-manager version
    stateVersion = "25.05";
  };

  programs.home-manager.enable = true;
}
