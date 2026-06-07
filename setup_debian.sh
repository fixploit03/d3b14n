#!/bin/bash
set -e

script=(
    "cek_root.sh"
    "konfigurasi_path_environment_variable.sh"
    "konfigurasi_network.sh"
    "konfigurasi_bashrc.sh"
    "update_system.sh"
    "instal_sudo.sh"
    "instal_utils.sh"
    "konfigurasi_grub.sh"
)

dir=src/setup/

for s in "${script[@]}"; do
    if [[ "${s}" == "cek_root.sh" || "${s}" == "konfigurasi_path_environment_variable.sh" ]]; then
        source "${dir}/${s}"
    else
        bash "${dir}/${s}"
    fi
done

echo -e "\n[+] Setup Debian selesai!"
read -p "[*] Tekan [Enter] untuk reboot..."
/sbin/reboot
