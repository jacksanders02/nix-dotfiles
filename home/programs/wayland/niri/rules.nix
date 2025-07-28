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
      draw-border-with-backgroud = true;
    }
  ];
in {
  programs.niri.settings = {
    window-rules = windowRules;
    layer-rules = [];
  };
}

