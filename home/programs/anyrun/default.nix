{ pkgs, inputs, ... }: 

{
  programs.anyrun = {
    enable = true;
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
        shell
        symbols
        translate
      ];

      width.fraction = 0.25;
      y.fraction = 0.3;
      closeOnClick = true;
    };
  };
}
