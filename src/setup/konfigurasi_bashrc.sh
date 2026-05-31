#!/bin/bash

bashrc=~/.bashrc
config=/etc/skel/.bashrc

if [[ -f "${bashrc}" ]]; then
    # backup bashrc
    cp "${bashrc}" "${bashrc}.bak"

    if [[ -f "${config}" ]]; then
        # copy template bashrc
        cp "${config}" "${bashrc}"

        # ubah warna prompt
        sed -i 's/01;32m/01;31m/g' "${bashrc}"
    fi
fi
