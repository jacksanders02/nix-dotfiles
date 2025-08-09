{ pkgs, ... }:

{
  imports = [
    ./niri
    ./waybar
    ./wofi
    ./swaync
  ];
  
  # ==== Wayland-Specific Packages ==== #
  home.packages = with pkgs; [
    # Screenshot
    grim
    slurp

    # Utils
    wl-clipboard
    wtype
    
    # Overview wallpaper
    swaybg
  ];

  # Wayland env vars
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
  };
  
  services.swayidle.enable = true; # idle management daemon
  services.polkit-gnome.enable = true; # polkit
}
