# SOURCE - https://github.com/linuxmobile/kaku/blob/niri/home/software/browsers/zen.nix

{
  inputs,
  pkgs,
  ...
}: let
  zenWithWayland = pkgs.symlinkJoin {
      name = "zen-browser-wayland";
      paths = [inputs.zen-browser.packages."${pkgs.system}".default];
      buildInputs = [pkgs.makeWrapper];
      postBuild = ''
        wrapProgram $out/bin/zen \
          --set MOZ_ENABLE_WAYLAND 1
      '';
    };
  in {
  home.packages = [zenWithWayland];
  }
