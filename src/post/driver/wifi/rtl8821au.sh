#!/bin/bash

dependensi=(
	"linux-headers-$(uname -r)"
	"build-essential"
	"bc"
	"git"
)

apt-get update

for d in "${dependensi[@]}"; do
	apt-get install -y "${d}"
done

cd /usr/local/src
git clone https://github.com/morrownr/8821au-20210708
cd 8821au-20210708

make -j$(nproc)
make install

modprobe 8821au
