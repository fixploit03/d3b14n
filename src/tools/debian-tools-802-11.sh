#!/bin/bash

path_apps=../../apps/80211

#--------------
# debian-tools-802-11
#--------------
apt install -y wireless-tools iw aircrack-ng pixiewps reaver bully mdk3 mdk4 macchanger cowpatty hcxdumptool hcxtools hcxkeys bettercap wifite horst wavemon linssid
#
# hostapd-wpe
dpkg -i "${path_apps}/80211/libunsafessl1.0.2_1.0.2u-0kali2_amd64.deb" "${path_apps}/80211/hostapd-wpe_2.10+git20220310-0kali3_amd64.deb"
apt install -y -f
#
# airgorah
wget https://github.com/martin-olivier/airgorah/releases/download/v0.7.4/airgorah_0.7.4_x86_64.deb
dpkg -i airgorah_0.7.4_x86_64.deb
apt install -y -f
rm airgorah_0.7.4_x86_64.deb
#
# kismet
wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key --quiet | gpg --dearmor | tee /usr/share/keyrings/kismet-archive-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/kismet-archive-keyring.gpg] https://www.kismetwireless.net/repos/apt/release/trixie trixie main' | tee /etc/apt/sources.list.d/kismet.list >/dev/null
apt update
apt install -y kismet
