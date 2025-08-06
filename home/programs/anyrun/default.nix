{ config, pkgs, inputs, ... }: 

let
  walImport = ''@import "${config.home.homeDirectory}/.cache/wal/colors-waybar.css";'';
in {
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
        shell
        translate
      ];

      width.fraction = 0.25;
      y.fraction = 0.3;
      hidePluginInfo = true;
      closeOnClick = true;
    };

    extraCss = walImport + "\n" + builtins.readFile ./style.css;
  };
}
