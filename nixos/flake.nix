{
  description = "NixOS config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };
  outputs = { nixpkgs, home-manager, nixos-wsl, ... }:
    let 
      system = "x86_64-linux";
    in {
    nixosConfiguration.nixos = nixpkgs.lib.nixosSystem {
                        inherit system;
                };
    nixosConfigurations.gnome = nixpkgs.lib.nixosSystem {
                        inherit system;
                        modules = [
                                ./gnome-configuration.nix
      ];
    };
    nixosConfigurations.gnomeEfi = nixpkgs.lib.nixosSystem {
                        inherit system;
                        modules = [
                                ./efi-gnome-configuration.nix
      ];
    };
    nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ 
        ./wsl-configuration.nix
        nixos-wsl.nixosModules.default
        {
          system.stateVersion = "24.05";
          wsl.enable= true;
        }
      ];
    };

    homeConfigurations.andyb = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./andyb.nix ];
    };
    homeConfigurations.sarahb = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      modules = [ ./sarahb.nix ];
    };
  };
}
