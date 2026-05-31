#!/bin/bash
#
# jangan dijalankan sebagai root!

path_saat_ini=$(pwd)
path_apps=../apps
path_bin=/usr/local/bin

sudo apt update

#--------------
# archiver
#--------------
sudo apt install -y zip unzip 7zip xarchiver
#
# rar
cd "${path_apps}"
tar -zxf rarlinux-x64-722.tar.gz
cd rar
sudo mv rar "${path_bin}"
sudo mv unrar "${path_bin}"
cd ..
rm -rf rar
rm rarlinux-x64-722.tar.gz
cd "${path_saat_ini}"

#--------------
# terminal
#--------------
sudo apt install -y terminator fonts-jetbrains-mono

#--------------
# tampilan
#--------------
sudo apt install -y numix-gtk-theme papirus-icon-theme numix-icon-theme

#--------------
# set theme
#--------------
gsettings set org.mate.interface gtk-theme "Numix"

#--------------
# set window
#--------------
gsettings set org.mate.Marco.general theme "Numix"

#--------------
# set wallpaper
#--------------
cd ../wallpapers
gsettings set org.mate.background picture-filename "$(pwd)/debian.jpg"
cd "${path_saat_ini}"

#--------------
# set icon
#--------------
gsettings set org.mate.interface icon-theme "Papirus-Dark"

#--------------
# set terminal
#--------------
gsettings set org.mate.applications-terminal exec "terminator"
mkdir -p ~/.config/terminator
cp ../config/terminator ~/.config/terminator/config

#--------------
# virtualbox guest additions
#--------------
sudo apt install -y build-essential linux-headers-$(uname -r) dkms perl
sudo mount /dev/cdrom /mnt
sudo /mnt/VBoxLinuxAdditions.run
# sudo usermod -aG vboxsf $USER
sudo reboot
