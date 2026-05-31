#!/bin/bash

dependensi=(
	"bc"
	"build-essential"
	"git"
	"linux-headers-$(uname -r)"
)

apt-get update -y

for d in "${dependensi[@]}"; do
	apt-get install "${d}" -y
done

cd /usr/local/src
git clone https://github.com/morrownr/8814au
cd 8814au

make -j$(nproc)
make install

modprobe 8814au
