#!/bin/bash
set -e

if [[ $EUID -ne 0 ]]; then
	echo "[-] Script ini harus dijalankan sebagai root!"
	exit 1
fi

apt update

user=${SUDO_USER:-$USER}
apt install -y sudo
/sbin/usermod -aG sudo "${user}"

if [[ ! -f /etc/profile.d/set-path.sh ]]; then
    echo 'export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"' > /etc/profile.d/set-path.sh
    chmod +x /etc/profile.d/set-path.sh
fi

echo -e "\n[+] Setup Debian selesai!"
read -p "[*] Tekan [Enter] untuk reboot..."
/sbin/reboot
