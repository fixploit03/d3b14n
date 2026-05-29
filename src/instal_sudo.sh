#!/bin/bash

apt install -y sudo

read -p "[?] Username: " username

if [[ -z "${username}" ]]; then
	echo "[-] Username tidak boleh kosong!"
	exit 1
fi

if id "${username}" &>/dev/null; then
	/sbin/usermod -aG sudo "${username}"
else
	echo "[-] Username '${username}' tidak ditemukan!"
	exit 1
fi
