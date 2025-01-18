{ config, pkgs, ... }: {
	home = {
		username = "andyb";
		homeDirectory = "/home/andyb";
		stateVersion = "24.11";
	};
	programs = {
		neovim = {
			enable = true;
			defaultEditor = true;
		};
		git = {
			enable = true;
		};
		nushell = {
			enable = true;
			shellAliases =
				let
					flakeDir = "~/.config/nixos";
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
