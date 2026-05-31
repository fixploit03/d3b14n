#!/bin/bash
#
# script ini jangan dijalankan sebagai root :)

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
cd ..

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
