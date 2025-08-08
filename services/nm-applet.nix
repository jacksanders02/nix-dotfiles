{ pkgs, ... }: {
  # Add nm-applet as systemd service
  systemd.user.services.nm-applet = {
    Unit = {
      Description = "nm-applet user service.";
      After = "graphical-session.target";
      PartOf = "graphical-session.target";
      Requisite = "graphical-session.target";
    };

    Install.WantedBy = [ "niri.service" ];

    Service = {
        Type = "simple";
        ExecStart = ''${pkgs.networkmanagerapplet}/bin/nm-applet'';
    };
  };
}
