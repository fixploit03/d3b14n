#!/bin/bash

sudo updatedb
echo -e "\n[+] Proses setup selesai!\n"
read -p "Tekan [Enter] untuk reboot..."
sudo reboot
