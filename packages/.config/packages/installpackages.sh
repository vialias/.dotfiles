#!/bin/zsh

sudo pacman -S --needed - < pacmanpackages.txt
sudo yay -S --needed - < aurpackages.txt
for pkg in $(cat flatpackpackages.txt)
    flatpak install -y $pkg
end


