#!/bin/bash

echo "[*] Mengecek root..."
if [[ $EUID -ne 0 ]]; then
	echo "[-] Script ini harus dijalankan sebagai root!"
	exit 1
else
    echo "[+] Script ini dijalankan sebagai root!"
fi
