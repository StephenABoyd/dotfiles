# My Dots

## Install (Non-NixOs)

### Prerequisites (if not using NixOS)
- Node
- ZSH (delete existing .zshrc before symlinking)
- OhMyZsh
- Starship
- [RG](https://github.com/BurntSushi/ripgrep)
- [FD](https://github.com/sharkdp/fd)
Create symlink for folders/files

### Neovim Configs
`ln -s ~/dotfiles/nvim ~/.config/nvim`

### Wezterm Configs
`ln -s ~/dotfiles/.wezterm.lua ~/.wezterm.lua`

### Zsh Configs
`ln -s ~/dotfiles/.zshrc ~/.zshrc`

## Install (NixOS)

### Non-WSL
```
cd <repo-location>
sudo nixos-reload switch --flake ./nixos#gnome
home-manager switch --flake ./nixos
ln -s ~/dotfiles/nvim ~/.config/nvim
```

### WSL
```
cd <repo-location>
sudo nixos-reload switch --flake ./nixos#wsl
home-manager switch --flake ./nixos
ln -s ~/dotfiles/nvim ~/.config/nvim
```

