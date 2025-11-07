#!/bin/bash

###Farshief's Arch Install Script###
###https://github.com/farshief/arch###

###Variables###
###Adjust these variables to configure the script###
INSTALL_DRIVE="/dev/vda"
WIFI_NETWORK=""
WIFI_PASSWORD=""

PARTITION_UEFI_SIZE=1G
PARTITION_SWAP_SIZE=8G
#PARTITION_ROOT_SIZE=
ROOT_FILESYSTEM_TYPE="ext4"


####Do NOT adjust anything below this line unless you know what you're doing or are willing to accept the consequences of pretending that you do####
UEFI_PART="${INSTALL_DRIVE}1"
SWAP_PART="${INSTALL_DRIVE}2"
ROOT_PART="${INSTALL_DRIVE}3"

###Functions###
function ping_check() {
	echo "Ensuring Connectivity to the Internet: "
	if ping -c 1 archlinux.org &> /dev/null; then
		echo "Success"
	else
		echo "Ping Failed: "$?
		echo "Exiting"
		exit
	fi
}

function partition_drive() {
	echo "Partition Drive: "
}

function create_filesystems() {
	echo "Creating FAT32 filesystem on esp $UEFI_PART"
	mkfs.fat -F 32 "$UEFI_PART"

	echo "Creating Swap"
	makeswap "$SWAP_PART"

	echo "Creating $ROOT_FILESYSTEM_TYPE on $ROOT_PART"

	mkfs.ext4 "$ROOT_PART"
}

function mount_filesystems() {
	mount $ROOT_PART /mnt
	mount --mkdir $UEFI_PART /mnt/boot
	swapon $SWAP_PART
}

function base_install() {
	echo "Installing Base Packages"
}

###Script###
ping_check

partition_drive

create_filesystems

mount_filesystems

base_install
