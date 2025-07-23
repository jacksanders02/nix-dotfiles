{
  config,
  pkgs,
  ...
}: {
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Return".action = spawn "${pkgs.kitty}/bin/kitty";
  };
}
