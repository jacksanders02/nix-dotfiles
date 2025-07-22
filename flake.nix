{
  description = "NixOS setup flake"
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };
  
  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations.blencathra = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ ./configuration.nix ];
    };
  };
}
