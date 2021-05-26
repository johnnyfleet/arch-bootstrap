#!/bin/bash
BASE_DISK=/dev/vda

echo Setting time
timedatectl set-ntp true

echo partition drive
# to create the partitions programatically (rather than manually)
# we're going to simulate the manual input to fdisk
# The sed script strips off all the comments so that we can 
# document what we're doing in-line with the actual commands
# Note that a blank line (commented as "default" will send a empty
# line terminated with a newline to take the fdisk default.
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${BASE_DISK}
	o # clear the in memory partition table
	n # new partition
	p # primary partition
	1 # partition number 1
	# default - start at beginning of disk 
	+10G # 10 GB root parttion
	n # new partition
	p # primary partition
	2 # partion number 2
	# default, start immediately after preceding partition
 	+19G #19 GB for home
 	n # new partition
 	p # primary partition
 	3 # partition number 1
	# default - start at beginning of disk
	# default, extend partition to end of disk 
	a # make a partition bootable
	1 # bootable partition is partition 1 -- /dev/sda1
	p # print the in-memory partition table
	w # write the partition table
	q # and we're done
EOF

echo setup as ext4

mkfs.ext4 ${BASE_DISK}1
mkfs.ext4 ${BASE_DISK}2

echo enable swap
mkswap ${BASE_DISK}3
swapon ${BASE_DISK}3

echo mount drives
mount /dev/vda1 /mnt
mkdir /mnt/home
mount /dev/vda2 /mnt/home

echo install the system
pacstrap /mnt base linux linux-firmware dhcpcd nano net-tools openssh vi sudo

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Pacific/Auckland /etc/localtime

hwclock --systohc

echo en_NZ.UTF-8 UTF-8 >> /etc/locale.gen

locale-gen

echo LANG=en_NZ.UTF-8 > /etc/locale.conf

echo ansibletest > /etc/hostname

echo 127.0.0.1	localhost >> /etc/hosts
echo ::1	localhost >> /etc/hosts
echo 127.0.0.1	ansibletest >> /etc/hosts

systemctl enable dhcpcd
systemctl enable sshd.service

echo set password for root
passwd
testing
testing

echo setup john as new user
useradd --create-home john
passwd john
testing
testing

echo add john to sudo group
usermod --append --groups wheel john
echo '%wheel ALL=(ALL) ALL' | sudo EDITOR='tee -a' visudo

mkinitcpio -p linux

echo setup grub
pacman -S --noconfirm grub

grub-install --target=i386-pc /dev/vda

grub-mkconfig -o /boot/grub/grub.cfg

exit

reboot

