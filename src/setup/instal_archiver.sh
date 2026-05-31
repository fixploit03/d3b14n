#!/bin/bash

path_bin=/usr/local/bin

apt install -y zip unzip 7zip xarchiver
#
# rar
tar -zxf ../../rarlinux-x64-722.tar.gz
cd rar
mv rar "${path_bin}"
mv unrar "${path_bin}"
cd ..
rm -rf rar
rm ../../rarlinux-x64-722.tar.gz
