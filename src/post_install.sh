#!/bin/bash
#
# jangan dijalankan sebagai root!

path_saat_ini=$(pwd)
path_apps=../apps
path_bin=/usr/local/bin

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
# tampilan
#--------------
sudo apt install -y papirus-icon-theme

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
