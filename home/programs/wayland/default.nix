{ pkgs, ... }:

{
  imports = [
    ./niri
  ];
  
  # ==== Wayland-Specific Packages ==== #
  home.packages = with pkgs; [
    # Screenshot
    grim
    slurp

    # Utils
    wl-clipboard
  ];

  # Wayland env vars
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
}
