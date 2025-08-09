{ pkgs, username, ... }: {
  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "${pkgs.niri}/bin/niri-session";
        user = "${username}";
      };
      default_session = initial_session;
    };
  };
}
