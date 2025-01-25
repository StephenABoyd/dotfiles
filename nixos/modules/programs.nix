{ config, pkgs, inputs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  programs.firefox.enable = true;
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  programs.waybar = {
    enable = true;
  };


  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    config = {
      credential.helper = "libsecret";
    };
  };

  environment.systemPackages = with pkgs; [
    home-manager
    orca-slicer
  ];
}
