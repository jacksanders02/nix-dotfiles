{ pkgs, ... }: {
  # Add swaybg as systemd service
  systemd.user.services.swaybg = {
    Unit = {
      Description = "SwayBG user service.";
      After = "graphical-session.target";
      PartOf = "graphical-session.target";
      Requisite = "graphical-session.target";
    };

    Install.WantedBy = [ "niri.service" ];

    Service = {
        Type = "simple";
        ExecStart = ''${pkgs.swaybg}/bin/swaybg -m fill -i "%h/.cache/wallpaper-picker/blurred-wallpaper.png"'';
    };
  };
}
