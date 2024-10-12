#!/bin/sh

set -xe

qemu-img create -f qcow2 "$2" 4G

qemu-system-x86_64 \
	-cdrom "$1" \
	-hda "$2" \
	-enable-kvm \
	-m 4096 \
	-cpu host \
	-audiodev alsa,id=snd0,out.buffer-length=500000,out.period-length=726  \
	-device virtio-mouse-pci \
	-device virtio-keyboard-pci \
	-net nic \
	-net user \
	-device virtio-vga-gl \
	-device usb-ehci,id=ehci \
	-display gtk,gl=on 
