{
  description = "NixOS setup flake";
  
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri.url = "github:sodiboo/niri-flake";

    anyrun.url = "github:anyrun-org/anyrun";
    
    swww.url = "github:LGFae/swww";
  };
  
  outputs = inputs@{ self, nixpkgs, home-manager, niri, ... }: {
    nixosConfigurations = {
      blencathra = let
        username = "jacksanders";
        specialArgs = { inherit username; inherit inputs; };
      in
        nixpkgs.lib.nixosSystem {
          inherit specialArgs;
          system = "x86_64-linux";
          
          modules = [ 
            ./hosts/blencathra
            ./users/${username}/nixos.nix 

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${username} = import ./users/${username}/home.nix;
            }
          ];
        };
    };
  };
}
