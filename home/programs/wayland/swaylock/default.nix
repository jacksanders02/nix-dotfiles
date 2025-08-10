{ pkgs, config, ... }:

let
  walImport = ''@import "${config.home.homeDirectory}/.cache/wal/colors-waybar.css";'';
in { 
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      image = "${config.home.homeDirectory}/.cache/wallpaper-picker/blurred-wallpaper.png";
      clock = true;
      timestr = "%H:%M";
      ignore-empty-password = true;
      indicator-idle-visible = true;
      grace = 30;
    };
  };
}
