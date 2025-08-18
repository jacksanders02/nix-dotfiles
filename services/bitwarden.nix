{ pkgs, ... }: {
  # Add bitwarden as systemd service
  systemd.user.services.bitwarden = {
    Unit = {
      Description = "Bitwarden user service.";
      After = "graphical-session.target";
      PartOf = "graphical-session.target";
      Requisite = "graphical-session.target";
    };

    Install.WantedBy = [ "niri.service" ];

    Service = {
        Type = "simple";
        ExecStart = ''${pkgs.bitwarden}/bin/bitwarden'';
    };
  };
}
