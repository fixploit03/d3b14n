#!/bin/bash
#
# jangan dijalankan sebagai root!

path_saat_ini=$(pwd)
path_apps=../apps
path_bin=/usr/local/bin

sudo apt update

#--------------
# utils
#--------------
sudo apt install -y curl wget tree tmux rsync net-tools fastfetch htop btop plocate bash-completion build-essential
    
#--------------
# archiver
#--------------
sudo apt install -y zip unzip 7zip xarchiver
#
# rar
cd "${path_apps}"
tar -zxf rarlinux-x64-722.tar.gz
cd rar
sudo mv rar "${path_bin}"
sudo mv unrar "${path_bin}"
cd ..
rm -rf rar
rm rarlinux-x64-722.tar.gz
cd "${path_saat_ini}"

#--------------
# terminal
#--------------
sudo apt install -y terminator fonts-jetbrains-mono

#--------------
# tampilan
#--------------
sudo apt install -y numix-gtk-theme papirus-icon-theme numix-icon-theme

#--------------
# 802.11
#--------------
sudo apt install -y wireless-tools iw aircrack-ng pixiewps reaver bully mdk3 mdk4 macchanger cowpatty hcxdumptool hcxtools hcxkeys bettercap wifite wireshark tshark horst wavemon
#
# hostapd-wpe
sudo dpkg -i "${path_apps}/80211/libunsafessl1.0.2_1.0.2u-0kali2_amd64.deb" "${path_apps}/80211/hostapd-wpe_2.10+git20220310-0kali3_amd64.deb"
sudo apt install -y -f
#
# kismet
wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key --quiet | gpg --dearmor | sudo tee /usr/share/keyrings/kismet-archive-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/kismet-archive-keyring.gpg] https://www.kismetwireless.net/repos/apt/release/trixie trixie main' | sudo tee /etc/apt/sources.list.d/kismet.list >/dev/null
sudo apt update
sudo apt install -y kismet

#--------------
# driver wifi
#--------------
sudo bash post/driver/wifi/rtl8188eus.sh

#--------------
# virtualbox guest additions
#--------------
if [[ $(systemd-detect-virt) == "oracle" ]]; then
    sudo apt install -y linux-headers-$(uname -r) dkms perl
    sudo mount /dev/cdrom /mnt
    if [[ -f /mnt/VBoxLinuxAdditions.run ]]; then
        sudo /mnt/VBoxLinuxAdditions.run
        sudo usermod -aG vboxsf $USER
    else
        echo "[-] ISO Guest Additions belum di-insert!"
        exit 1
    fi
fi

#--------------
# set theme
#--------------
gsettings set org.mate.interface gtk-theme "Numix"

#--------------
# set window
#--------------
gsettings set org.mate.Marco.general theme "Numix"

#--------------
# set wallpaper
#--------------
cd ../wallpapers
gsettings set org.mate.background picture-filename "$(pwd)/debian.jpg"
cd "${path_saat_ini}"

#--------------
# set icon
#--------------
gsettings set org.mate.interface icon-theme "Papirus-Dark"

#--------------
# set terminal
#--------------
gsettings set org.mate.applications-terminal exec "terminator"
mkdir -p ~/.config/terminator
cp ../config/terminator ~/.config/terminator/config

#--------------
# Selesai
#--------------
sudo updatedb
read -p "Tekan [Enter] untuk reboot..."
sudo reboot
