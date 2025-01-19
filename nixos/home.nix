{ config, pkgs, lib, ... }: {
  home = {
    username = "andyb";
    homeDirectory = "/home/andyb";
    stateVersion = "24.11";
  };
  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableNushellIntegration = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      withNodeJs = true;
      withPython3 = true;
    };
    nushell = {
      enable = true;
      shellAliases =
        let
          flakeDir = "~/dotfiles/nixos";
        in {
        rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
        upd = "sudo nixos-rebuild update ${flakeDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
        hms = "home-manager switch --flake ${flakeDir}";
      };
    };
    home-manager = {
      enable = true;
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
  };
}
