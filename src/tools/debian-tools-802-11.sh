#--------------
# debian-tools-802-11
#--------------
sudo apt install -y wireless-tools iw aircrack-ng pixiewps reaver bully mdk3 mdk4 macchanger cowpatty hcxdumptool hcxtools hcxkeys bettercap wifite horst wavemon
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
