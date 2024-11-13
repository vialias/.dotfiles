sudo pacman -S --needed - < package_list.txt
sudo yay -S --needed - < package_list.txt
for pkg in (cat flatpackpackages.txt)
    flatpak install -y $pkg
end


