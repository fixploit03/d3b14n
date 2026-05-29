#!/bin/bash

path=/etc/profile.d/set-path.sh

echo 'export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"' > "${path}"
chmod +x "${path}"
