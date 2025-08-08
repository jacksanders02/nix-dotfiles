{ pkgs, ... }: {
  # Add want for waybar systemd service
  systemd.user.services.waybar = {
    Unit = {
      Description = "Waybar user service.";
      After = "graphical-session.target";
      PartOf = "graphical-session.target";
      Requisite = "graphical-session.target";
    };

    Install.WantedBy = [ "niri.service" ];

    Service = {
        Type = "simple";
        ExecStart = ''${pkgs.waybar}/bin/waybar'';
    };
  };
}
