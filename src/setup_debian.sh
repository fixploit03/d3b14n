#!/bin/bash

source cek_root.sh
bash update_system.sh
bash instal_sudo.sh
bash konfigurasi_path_environment_variable.sh
bash konfigurasi_network.sh
bash konfigurasi_bashrc.sh
bash konfigurasi_grub.sh
