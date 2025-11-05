#!/bin/bash

###Farshief's Arch Install Script###

###Variables###
INSTALL_DRIVE="/dev/vda"

PARTITION_UEFI_SIZE=1G
PARTITION_SWAP_SIZE=8G
#PARTITION_ROOT_SIZE=



###Functions###
function partition_drive() {
	echo "Partition Drive: "
}

function create_filesystems() {
	echo "Creating UEFI filesystem on ${INSTALL_DRIVE}1"
	mkfs.fat -F 32 "${INSTALL_DRIVE}"1

	echo "Creating Swap"
	makeswap "${INSTALL_DRIVE}"2
}

###Script###
echo "Ensuring Connectivity to the Internet..."
ping -c 3 archlinux.org
