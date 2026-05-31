#!/bin/bash

dependensi=(
	"bc"
	"build-essential"
	"git"
	"linux-headers-$(uname -r)"
)

apt-get update

for d in "${dependensi[@]}"; do
	apt-get install -y "${d}"
done

echo 'blacklist r8188eu' | tee -a '/etc/modprobe.d/realtek.conf'
echo 'blacklist rtl8xxxu' | tee -a '/etc/modprobe.d/realtek.conf'

cd /usr/local/src
git clone https://github.com/aircrack-ng/rtl8188eus
cd rtl8188eus

make -j$(nproc)
make install

rmmod r8188eu rtl8xxxu 8188eu 2>/dev/null
modprobe 8188eu
