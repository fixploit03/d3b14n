#!/bin/bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
	echo "ERROR: Script ini harus dijalankan sebagai root!"
	exit 1
fi

read -p "Mau menggunakan repositori Testing? [Y/n]: " nanya

case "${nanya}" in
	y|Y)
		cp /etc/apt/sources.list /etc/apt/sources.list.bak
		cat << EOF > /etc/apt/sources.list
deb https://ftp.debian.org/debian/ testing contrib main non-free non-free-firmware
deb https://ftp.debian.org/debian/ testing-updates contrib main non-free non-free-firmware
deb https://ftp.debian.org/debian/ testing-proposed-updates contrib main non-free non-free-firmware
deb https://ftp.debian.org/debian/ testing-backports contrib main non-free non-free-firmware
deb https://security.debian.org/debian-security/ testing-security contrib main non-free non-free-firmware
EOF
		;;
	n|N)
		:
		;;
	*)
		echo "ERROR: Masukan tidak valid! Harap masukkan 'Y/n'."
		exit 1
		;;
esac

apt update
apt full-upgrade -y

user="${SUDO_USER:-$USER}"
apt install -y sudo
/sbin/usermod -aG sudo "${user}"

if [[ ! -f /etc/profile.d/set-path.sh ]]; then
	echo 'export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"' > /etc/profile.d/set-path.sh
	chmod +x /etc/profile.d/set-path.sh
fi

echo -e "\nSetup selesai!"
read -rp "Tekan [Enter] untuk reboot..."
/sbin/reboot
