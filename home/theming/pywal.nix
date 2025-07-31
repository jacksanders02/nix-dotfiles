{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: {
  programs.pywal = {
    enable = true;
    package = pkgs.pywal16;
  };
}
