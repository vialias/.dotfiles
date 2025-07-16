#!/sbin/bash

pacman -Qqe > pacmanpackages.txt
flatpak list --app > flatpakpackages.txt
pacman -Qqm > aurpackages.txt


