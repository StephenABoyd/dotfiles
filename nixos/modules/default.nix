{ config, pkgs, ... }:
{
  imports = [
    ./locale.nix
    ./network.nix
    ./services.nix
    ./users.nix
    ./programs.nix
    ./garbage-collect.nix
    ./fonts.nix
    ./setup.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
}
