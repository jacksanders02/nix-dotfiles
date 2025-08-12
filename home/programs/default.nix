{ inputs, pkgs, ... }: {
  imports = [
    ./cli.nix
    ./git.nix
    ./anyrun
    ./wayland
    ./programming
    
    ./browsers/zen
    ./browsers/firefox
  ];

  home.packages = with pkgs; [
    #==== Communication ====#
    vesktop

    #==== GNOME ====#
    celluloid # GTK wrapper for mpv
    dconf-editor
    eyedropper
    file-roller # Archive manager
    gnome-control-center
    gnome-text-editor
    keypunch # Typing practice
    loupe # Image viewer
    nautilus # File manager
    (papers.override { supportNautilus = true; }) # Document viewer
    pwvucontrol # pavucontrol with pipewire instead of pulse
    pamixer
    resources
    
    networkmanagerapplet # Edit nm connections with nm-connection-editor
  ];
}
