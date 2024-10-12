#!/bin/sh

set -xe

qemu-img create -f qcow2 "$2" 4G

qemu-system-x86_64 \
	-cdrom "$1" \
   	-hda "$2" \
	-enable-kvm -vga std \
	-m 2048 -smp 2 -cpu host \
	-audiodev id=none,driver=none \
	-net nic,model=e1000 -net user \
	-boot d \
	-monitor stdio
