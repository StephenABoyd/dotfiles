{ config, pkgs, ... }:
{
  users.mutableUsers = true;

  xdg.portal.enable = true;

  users.users.andyb = {
    isNormalUser = true;
    description = "Andy Boyd";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;
    packages = with pkgs; [
      flatpak
      gnome.gnome-software
      wezterm
      discord
      grimblast
      waybar
      (pkgs.waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      }))
      dunst
      libnotify
      swww
      rofi-wayland
    ];
  };

  users.users.sarahb = {
    isNormalUser = true;
    description = "Sarah Boyd"; 
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;
    packages = with pkgs; [
      flatpak
      gnome.gnome-software
    ];
  };
}
