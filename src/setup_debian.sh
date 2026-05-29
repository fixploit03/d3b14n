#!/bin/bash
#
# Debian 13 (Trixie)

source cek_root.sh
# bash konfigurasi_repositori.sh
bash update_system.sh
bash konfigurasi_sudo.sh
bash konfigurasi_path_environment_variable.sh
bash konfigurasi_network.sh
bash konfigurasi_bashrc.sh
bash konfigurasi_grub.sh
