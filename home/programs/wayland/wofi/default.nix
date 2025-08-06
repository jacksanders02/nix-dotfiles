{ pkgs, config, lib, ... }: 

let
  walImport = ''@import "${config.home.homeDirectory}/.cache/wal/colors-waybar.css";'';
in {
  programs.wofi = {
    enable = true;
    style = walImport + "\n" + builtins.readFile ./style.css;
  };
  
  # Copy config files across
  home.file."${config.xdg.configHome}/wofi" = {
    source = ./.config;
    recursive = true;
  };
  
  # Copy scripts across
  home.file.".scripts/wofi" = {
    source = ./scripts;
    recursive = true;
  };
  
  # Add desktop files
  xdg.desktopEntries = {
    wallpaperPicker = {
      name = "Change Wallpaper";
      genericName = "Wallpaper Picker";
      exec = "${config.home.homeDirectory}/.scripts/wofi/wofi-wallpaper-selector.sh";
      terminal = false;
      categories = [ "Settings" "Utility" ];
    };
  };
}
