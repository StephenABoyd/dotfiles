{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./modules/default.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # DO NOT CHANGE
  system.stateVersion = "24.11";
}
