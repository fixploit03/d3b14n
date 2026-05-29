#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "[-] Script ini harus dijalankan sebagai root!"
	exit 1
fi
