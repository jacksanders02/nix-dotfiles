{ inputs, pkgs, ... }: {
  imports = [
    ./common.nix
    ./git.nix
    ./anyrun
    ./wayland
  ];

  home.packages = with pkgs; [
    #==== Communication ====#
    vesktop

    #==== GNOME ====#
    celluloid # GTK wrapper for mpv
    eyedropper
    file-roller # Archive manager
    gnome-control-center
    gnome-text-editor
    keypunch # Typing practice
    loupe # Image viewer
    nautilus # File manager
    (papers.override { supportNautilus = true; }) # Document viewer
    pwvucontrol # pavucontrol with pipewire instead of pulse
    resources

    #==== Misc ====#
  ];
}
