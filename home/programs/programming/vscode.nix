# SOURCE - https://github.com/HeitorAugustoLN/betterfox-nix

{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhs;
  };
  
  # Fix OS keyring detection
  # https://errorism.dev/issues/microsoft-vscode-linux-an-os-keyring-couldnt-be-identified-for-storing-the-encryption-related-data-in-your-current-
  home.file.".vscode/argv.json" = {
    force = true;
    text = ''
      {
      	// "disable-hardware-acceleration": true,
      	"enable-crash-reporter": true,
      	// Unique id used for correlating crash reports sent from this instance.
      	// Do not edit this value.
      	"crash-reporter-id": "YOUR_CRASH_ID_HERE",
      	"password-store": "gnome"
      }
    '';
  };
}
