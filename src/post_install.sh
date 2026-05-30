#!/bin/bash

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
mv rar "${path_bin}"
mv unrar "${path_bin}"
cd ..
rm -rf rar
rm rarlinux-x64-722.tar.gz
cd "${path_saat_ini}"

#--------------
# set wallpaper
#--------------
cd ../wallpapers
gsettings set org.mate.background picture-filename "${path_saat_ini}/debian.jpg"
