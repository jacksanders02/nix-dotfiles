# Window rules go here
{ ... }: let
  windowRules = [
    {
      geometry-corner-radius = let
        radius = 5.0;
      in {
        bottom-left = radius;
        bottom-right = radius;
        top-left = radius;
        top-right = radius;
      };
      clip-to-geometry = true;
      draw-border-with-background = true;
    }
    
    {
      matches = [
        {is-floating = true;}
      ];
      shadow.enable = true;
    }
    
    {
      matches = [
        {
          is-window-cast-target = true;
        }
      ];
      focus-ring = {
        active.color = "#f38ba8";
        inactive.color = "#7d0d2d";
      };
      border = {
        inactive.color = "#7d0d2d";
      };
      shadow = {
        color = "#7d0d2d70";
      };
      tab-indicator = {
        active.color = "#f38ba8";
        inactive.color = "#7d0d2d";
      };
    }
    
    {
      matches = [
        {app-id = "zen";}
        {app-id = "firefox";}
        {app-id = "chromium-browser";}
        {app-id = "edge";}
      ];
      open-maximized = true;
    }
    
    {
      matches = [
        {
          app-id = "firefox";
          title = "Picture-in-Picture";
        }
      ];
      open-floating = true;
      default-floating-position = {
        x = 32;
        y = 32;
        relative-to = "bottom-right";
      };
      default-column-width = {fixed = 480;};
      default-window-height = {fixed = 270;};
    }
    {
      matches = [
        {
          app-id = "zen";
          title = "Picture-in-Picture";
        }
      ];
      open-floating = true;
      default-floating-position = {
        x = 32;
        y = 32;
        relative-to = "bottom-right";
      };
      default-column-width = {fixed = 480;};
      default-window-height = {fixed = 270;};
    }
    {
      matches = [{title = "Picture in picture";}];
      open-floating = true;
      default-floating-position = {
        x = 32;
        y = 32;
        relative-to = "bottom-right";
      };
    }
    {
      matches = [{title = "Discord Popout";}];
      open-floating = true;
      default-floating-position = {
        x = 32;
        y = 32;
        relative-to = "bottom-right";
      };
    }
    
    {
      matches = [
        { app-id = "com.saivert.pwvucontrol"; }
        { app-id = "io.github.fsobolev.Cavalier"; }
        { app-id = "dialog"; }
        { app-id = "popup"; }
        { app-id = "task_dialog"; }
        { app-id = "gcr-prompter"; }
        { app-id = "file-roller"; }
        { app-id = "org.gnome.FileRoller"; }
        { app-id = "nm-connection-editor"; }
        { app-id = "blueman-manager"; }
        { app-id = "xdg-desktop-portal-gtk"; }
        { app-id = "org.kde.polkit-kde-authentication-agent-1"; }
        { app-id = "pinentry"; }
        { title = "Progress"; }
        { title = "File Operations"; }
        { title = "Copying"; }
        { title = "Moving"; }
        { title = "Properties"; }
        { title = "Downloads"; }
        { title = "file progress"; }
        { title = "Confirm"; }
        { title = "Authentication Required"; }
        { title = "Notice"; }
        { title = "Warning"; }
        { title = "Error"; }
      ];
      open-floating = true;
    }
    
    {
      matches = [
        { app-id = "com.saivert.pwvucontrol"; }
        { app-id = "blueman-manager"; }
        { app-id = "nm-connection-editor"; }
        { app-id = "nm-applet"; }
      ];
      default-floating-position = {
        x = 6;
        y = 6;
        relative-to = "top-right";
      };
    }
    
    {
      matches = [
        { app-id = "com.saivert.pwvucontrol"; }
      ];
      default-column-width = {fixed = 550;};
      default-window-height = {fixed = 700;};
    }
    
    {
      matches = [
        { app-id = "blueman-manager"; }
      ];
      default-column-width = {fixed = 500;};
      default-window-height = {fixed = 350;};
    }
    
    {
      matches = [
        { app-id = "nm-connection-editor"; }
        { app-id = "nm-applet"; }
      ];
      default-column-width = {fixed = 250;};
      default-window-height = {fixed = 350;};
    }
  ];
in {
  programs.niri.settings = {
    window-rules = windowRules;
    layer-rules = [];
  };
}

