#!/bin/bash
#Install some packages if i forgot to install them
sudo pacman -S stow zsh kitty tmux xclip --needed

#Stowing stuff
stow git
stow tmux
stow zsh
stow kitty
stow waybar
stow hypr

#Stop kitty from stealing default file manager (no longer needed)
#xdg-mime default org.gnome.Nautilus.desktop inode/directory

# Zsh stuff
curl -sS https://starship.rs/install.sh | sh
sudo pacman -S zsh-syntax-highlighting zsh-autosuggestions --needed
chsh -s /bin/zsh

#Tmux 
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
