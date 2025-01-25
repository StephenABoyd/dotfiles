{ config, pkgs, lib, ... }: {
  home = {
    username = "andyb";
    homeDirectory = "/home/andyb";
    stateVersion = "24.11";
    # For electron apps to utilize hyprland
    sessionVariables.NIXOS_OZOLE_WL = "1";
  };
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      monitor = ",preferred,auto,1";
      general = {
        resize_on_border = true;
        # extend_border_grab_area = true;
        # hover_icon_on_border = true;
        gaps_in = 12;
        gaps_out = 6;
      };
      decoration = {
        rounding = 6;
        active_opacity = 0.9;
        inactive_opacity = 0.85;
        fullscreen_opacity = 1.0;
        dim_inactive = true;
        dim_strength = 0.1;
        blur = {
          enabled = true;
        };
      };
      input = {
        natural_scroll = true;
        touchpad = {
          natural_scroll = true;
        };
      };
      bind =
        [
          "$mod, F, exec, firefox"
          "$mod, Q, exec, kitty"
          "$mod, C, killactive"
          "$mod, M, exit"
          ", Print, exec, grimblast copy area"
          "$mod, Print, exec, grimblast copy screen"
        ]
        ++ (
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              "$mod, SPACE, exec, rofi -show drun -show-icons"
            ]
          )
        9)
      );
    };
    extraConfig = ''
      exec-once = waybar
      exec-once = swww-daemon
    '';
  };
  programs = {
    waybar = {
      enable = true;
    };
    kitty = {
      enable = true;
      settings = {
        # Colors from Catppuccin Frappe for kitty config
        foreground = "#c6d0f5";
        background = "#303446";
        selection_foreground = "#303446";
        selection_background = "#f2d5cf";
        cursor = "#f2d5cf";
        cursor_text_color = "#303446";
        url_color = "#f2d5cf";

        # Kitty window border colors
        active_border_color = "#babbf1";
        inactive_border_color ="#737994";
        bell_border_color ="#e5c890";

        # OS Window titlebar colors
        wayland_titlebar_color = "system";
        macos_titlebar_color = "system";

        # Tab bar colors
        active_tab_foreground = "#232634";
        active_tab_background = "#ca9ee6";
        inactive_tab_foreground = "#c6d0f5";
        inactive_tab_background = "#292c3c";
        tab_bar_background = "#232634";

        # Colors for marks (marked text in the terminal)
        mark1_foreground = "#303446";
        mark1_background = "#babbf1";
        mark2_foreground = "#303446";
        mark2_background = "#ca9ee6";
        mark3_foreground = "#303446";
        mark3_background = "#85c1dc";

        # The 16 terminal colors

        # black
        color0 = "#51576d";
        color8 = "#626880";

        # red
        color1 = "#e78284";
        color9 = "#e78284";

        # green
        color2 = "#a6d189";
        color10 = "#a6d189";

        # yellow
        color3 = "#e5c890";
        color11 = "#e5c890";

        # blue
        color4 = "#8caaee";
        color12 = "#8caaee";

        # magenta
        color5 = "#f4b8e4";
        color13 = "#f4b8e4";

        # cyan
        color6 = "#81c8be";
        color14 = "#81c8be";

        # white
        color7 = "#b5bfe2";
        color15 = "#a5adce";

        # Font
        font_family = "Fira Code";
        font_size = 12.5;

        # Other
        "modify_font cell_height" = "120%";
        "modify_font cell_width" = "100%";
        backgroud_opacity = 0.7;
        background_blur = 0;
        window_padding_width = 6;

      };
    };
    fd = {
      enable = true;
      hidden = true;
    };
    ripgrep.enable = true;
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
