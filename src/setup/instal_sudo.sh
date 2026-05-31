#!/bin/bash

user=${SUDO_USER:-$USER}

apt install -y sudo
/sbin/usermod -aG sudo "${user}"
