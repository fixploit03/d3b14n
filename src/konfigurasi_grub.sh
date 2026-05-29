#!/bin/bash

file="/etc/default/grub"
status=0

if [[ -f "${file}" ]]; then
	# ubah nama interface dari wlx ke wlan
	if ! grep -q "net.ifnames=0 biosdevname=0" "${file}"; then
		sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/ s/"$/ net.ifnames=0 biosdevname=0"/' "${file}"
		status=1
	fi

	# disable ipv6
	if ! grep -q "ipv6.disable=1" "${file}"; then
        	sed -i '/GRUB_CMDLINE_LINUX_DEFAULT/ s/"$/ ipv6.disable=1"/' "${file}"
		status=1
	fi

	if [[ "${status}" -eq 1 ]]; then
		/sbin/grub-mkconfig -o /boot/grub/grub.cfg
		/sbin/reboot
	fi
fi
