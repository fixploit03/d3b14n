#!/bin/bash
#
# Debian 13 (Trixie)

source setup/cek_root.sh

bash setup/update_system.sh
bash setup/konfigurasi_sudo.sh
bash setup/konfigurasi_path_environment_variable.sh
bash setup/konfigurasi_network.sh
bash setup/konfigurasi_bashrc.sh
bash setup/konfigurasi_grub.sh
