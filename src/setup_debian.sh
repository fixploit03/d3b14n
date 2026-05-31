#!/bin/bash
#
# Debian 13 (Trixie)

source setup/cek_root.sh

bash setup/konfigurasi_path_environment_variable.sh
bash setup/konfigurasi_network.sh
bash setup/konfigurasi_bashrc.sh
bash setup/update_system.sh
bash setup/instal_sudo.sh
bash setup/instal_utils.sh
bash setup/instal_archiver.sh
bash setup/instal_tampilan.sh
bash setup/instal_terminal.sh
bash setup/instal_virtualbox_guest_additions.sh
bash setup/konfigurasi_grub.sh
bash setup/selesai.sh
