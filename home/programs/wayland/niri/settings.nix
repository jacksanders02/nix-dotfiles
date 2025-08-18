{ 
  config, 
  pkgs,
  rootPath,
  ...
}: {
  # Import required systemd services
  imports = [
    (rootPath + /services/swaybg.nix)
    (rootPath + /services/nm-applet.nix)
    (rootPath + /services/waybar.nix)
    (rootPath + /services/bitwarden.nix)
  ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      environment = {
        CLUTTER_BACKEND = "wayland";
        DISPLAY = null;
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        SDL_VIDEODRIVER = "wayland";
      }; 
      
      spawn-at-startup = [
        { command = ["swww-daemon"]; }
        { command = ["wl-paste" "--watch" "cliphist" "store"]; }
        { command = ["wl-paste" "--type text" "--watch" "cliphist" "store"]; }
        { command = ["swaylock" "--grace" "0"]; }
      ];

      input = {
        touchpad = {
          accel-profile = "flat";
          click-method = "button-areas";
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
        };

        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "90%";
        };

        warp-mouse-to-focus.enable = false;
        workspace-auto-back-and-forth = true;
      };

      screenshot-path = "~/Pictures/screenshots/screenshot_%Y-%m-%d-%H%M%S.png";

      outputs = {
        # Laptop
        "eDP-1" = {
          mode = {
            width = 1920;
            height = 1080;
          };
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        };
      
        # PC
        "DP-4" = {
          mode = {
            width = 2560;
            height = 1440;
          };
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        }; 

        "HDMI-A-3" = {
          mode = {
            width = 1920;
            height = 1080;
          };
          scale = 1.0;
          position = {
            x = -1920;
            y = 720;
          };
        };
      };

      gestures = { hot-corners.enable = true; };

      cursor = {
        size = 25;
        theme = "${config.home.pointerCursor.name}";
      };

      layout = {
        focus-ring.enable = false;

        border = {
          enable = true;
          width = 4;
          active.color = "#ED61D730";
          inactive.color = "#B8149F30";
        };

        shadow.enable = true;

        preset-column-widths = [
          { proportion = 0.25; }
          { proportion = 0.50; }
          { proportion = 0.75; }
          { proportion = 1.00; }
        ];
        default-column-width = { proportion = 0.50; };

        gaps = 6;
      };

    # Disable window decorations
    prefer-no-csd = true;

    };
  };
}
