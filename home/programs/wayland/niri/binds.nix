{
  config,
  pkgs,
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; let
    set-volume = spawn "wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@";
    brillo = spawn "${pkgs.brillo}/bin/brillo" "-q" "-u" "300000";
    playerctl = spawn "${pkgs.playerctl}/bin/playerctl";
  in {
    # ==== Media-Related Keybinds ==== #
    "XF86AudioMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle";
    "XF86AudioMicMute".action = spawn "wpctl" "set-mute" "@DEFAULT_AUDIO_SOURCE@" "toggle";

    "XF86AudioPlay".action = playerctl "play-pause";
    "XF86AudioStop".action = playerctl "pause";
    "XF86AudioPrev".action = playerctl "previous";
    "XF86AudioNext".action = playerctl "next";

    "XF86AudioRaiseVolume".action = set-volume "5%+";
    "XF86AudioLowerVolume".action = set-volume "5%-";

    "XF86MonBrightnessUp".action = brillo "-A" "5";
    "XF86MonBrightnessDown".action = brillo "-U" "5";

    # ==== Screen Capture ==== #
    "Print".action.screenshot-screen = {write-to-disk = true;};
    "Mod+Shift+Alt+S".action = screenshot-window;
    "Mod+Shift+S".action.screenshot = {show-pointer = false;};
    "Mod+Shift+C".action = spawn "${pkgs.eyedropper}/bin/eyedropper";
   
    # ==== Spawn Programs ==== # 
    "Mod+Space".action = spawn "${pkgs.anyrun}/bin/anyrun";
    "Mod+Return".action = spawn "${pkgs.kitty}/bin/kitty";
    "Mod+F".action = spawn "${pkgs.nautilus}/bin/nautilus";
    "Mod+W".action = spawn "${pkgs.firefox-devedition}/bin/firefox-devedition";

    "Mod+U".action = spawn "env XDG_CURRENT_DESKTOP=gnome gnome-control-center";

    "Mod+Q".action = close-window;
    "Mod+S".action = switch-preset-column-width;
    "Mod+M".action = maximize-column;

    "Mod+1".action = set-column-width "25%";
    "Mod+2".action = set-column-width "50%";
    "Mod+3".action = set-column-width "75%";
    "Mod+4".action = set-column-width "100%";
    # "Mod+Shift+F".action = fullscreen-window;
    "Mod+Shift+F".action = expand-column-to-available-width;

    "Mod+Comma".action = consume-window-into-column;
    "Mod+Period".action = expel-window-from-column;
    "Mod+C".action = center-visible-columns;
    "Mod+Tab".action = switch-focus-between-floating-and-tiling;

    "Mod+Minus".action = set-column-width "-10%";
    "Mod+Plus".action = set-column-width "+10%";
    "Mod+Shift+Minus".action = set-window-height "-10%";
    "Mod+Shift+Plus".action = set-window-height "+10%";

    # ==== Workspace/Column Keybinds ==== #
    "Mod+WheelScrollLeft".action = focus-column-left;
    "Mod+WheelScrollRight".action = focus-column-right;
    "Mod+Shift+WheelScrollUp".action = focus-column-left;
    "Mod+Shift+WheelScrollUp".cooldown-ms = 150;
    "Mod+Shift+WheelScrollDown".action = focus-column-right;
    "Mod+Shift+WheelScrollDown".cooldown-ms = 150;
    "Mod+WheelScrollUp".action = focus-workspace-up;
    "Mod+WheelScrollUp".cooldown-ms = 150;
    "Mod+WheelScrollDown".action = focus-workspace-down;
    "Mod+WheelScrollDown".cooldown-ms = 150;
    
    "Mod+Left".action = focus-column-left;
    "Mod+Right".action = focus-column-right;
    "Mod+Down".action = focus-workspace-down;
    "Mod+Up".action = focus-workspace-up;
  
    "Mod+Shift+Q".action = quit;
  };
}
