#!/bin/bash

config=/etc/profile.d/set-path.sh

if [[ ! -f "${config}" ]]; then
    echo "[*] Konfigurasi Path Environment Variable..."
    echo 'export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"' > "${config}"
    chmod +x "${config}"
fi
