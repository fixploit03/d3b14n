#!/bin/bash

bashrc=~/.bashrc
config=/etc/skel/.bashrc

# backup bashrc
cp "${bashrc}" "${bashrc}.bak"

# copy template bashrc
cp "${config}" "${bashrc}"

# ubah warna prompt
sed -i 's/01;32m/01;31m/g' "${bashrc}"
