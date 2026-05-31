#!/bin/bash

user=${SUDO_USER:-$USER}
cdrom=$(/sbin/blkid -t TYPE=iso9660 -o device | head -1)

if [[ $(systemd-detect-virt) == "oracle" ]]; then
    apt install -y linux-headers-$(uname -r) dkms perl

    if [[ -z "${cdrom}" ]]; then
        echo "[-] Tidak ada ISO yang terdeteksi!"
        exit 1
    fi

    mount "${cdrom}" /mnt

    if [[ -f /mnt/VBoxLinuxAdditions.run ]]; then
        /mnt/VBoxLinuxAdditions.run
        /sbin/usermod -aG vboxsf "${user}"
        umount /mnt
    else
        echo "[-] ISO Guest Additions belum di-insert!"
        umount /mnt
        exit 1
    fi
fi
