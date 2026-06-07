#!/bin/bash

user=${SUDO_USER:-$USER}

echo "[*] Menginstal sudo..."
apt install -y sudo

echo "[*] Memasukkan user '${user}' ke dalam grup sudo..."
/sbin/usermod -aG sudo "${user}"
