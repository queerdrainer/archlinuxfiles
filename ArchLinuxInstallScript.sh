#!/bin/sh

sleep 1 && echo "ARCH LINUX INSTALL SCRIPT by @yigitnewsted"
sleep 1 && echo "If you can't be bothered to configure Arch Linux by hand,
       use this script and it will (most likely) configure your
            system by itself. Good luck."
sleep 0
sleep 0
sleep 1 && echo "Make sure you partitioned your storage to:
 - /dev/sda1 as boot
 - /dev/sda2 as root
 - /dev/sda3 as swap
 - /dev/sda4 as home

if not, this script will not work."

echo "If your system is not EFI, do NOT USE THIS! YOU WILL BE GIVEN A 10
SECOND PERIOD TO CTRL+C OUT OF THE SCRIPT IF YOU'RE USING LEGACY!"

sleep 10

echo "PROCEEDING WITH INSTALL!"

echo ""

sleep 1 && echo "Please make sure that you have partitioned correctly.
the script will proceed anyway."

sleep 1  && echo "Loading Turkish keyboard set."

sudo loadkeys trq

echo ""
sleep 1 && echo "Checking internet."

ip link
ping -c archlinux.org

echo ""
sleep 1 && echo "Making filesystems."
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda4
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda3
swapon /dev/sda3

echo ""
sleep 1 && echo "Mounting file systems."
mount /dev/sda2 /mnt
mkdir /mnt/boot
mkdir /mnt/home
mount /dev/sda4 /mnt/home
mount /dev/sda1 /mnt/boot

echo ""
sleep 1 && echo "Installing base system. (hopefully you have internet)"
pacstrap /mnt base base-devel linux linux-firmware nano 

echo ""
sleep 1 && echo "Generating fstab."
genfstab -U /mnt >> /mnt/etc/fstab

echo ""
sleep 1 && echo "Chrooting into installed system."
arch-chroot /mnt

echo ""
echo "Chrooted successfully."
sleep 1 && echo "Setting timezone to Turkey."
ln -sf /usr/share/zoneinfo/Turkey /etc/localtime
hwclock --systohc

echo "Installing GRUB bootloader."
sudo pacman -S grub efibootmgr networkmanager nm-connection-editor network-manager-applet
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
systemctl start NetworkManager

echo ""
sleep 1 && echo "Arch Linux has been installed!"
sleep 1 && echo "You can now add a hostname, set"
sleep 1 && echo "root password, and do the rest."
sleep 0 && echo "Good luck!"

echo ""
sleep 1 && echo "Arch Install script by @yigitnewsted on Telegram"

echo ""
sleep 1 && echo "Rebooting in 5 seconds."
sleep 5 && sudo reboot
