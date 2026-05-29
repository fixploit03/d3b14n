#!/bin/bash

path_apps=../apps
path_bin=/usr/local/bin

# rar
cd "${path_apps}"
tar -zxf rarlinux-x64-722.tar.gz
cd rar
mv rar "${path_bin}"
mv unrar "${path_bin}"
cd ..
rm -rf rar
rm rarlinux-x64-722.tar.gz
