{ config, pkgs, inputs, lib, ... }: {
  imports = [ inputs.niri.homeModules.niri ];

  programs.niri = {
    enable = true;
  };
}
