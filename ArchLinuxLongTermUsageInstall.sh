#!/bin/sh

echo ""
echo""
echo "Setting up Arch Linux for long term usage."
sleep 2 && echo "This will install the Budgie Desktop, some GNOME apps"
echo "Kdenlive, Firefox, Telegram and other programs that I use."
echo ""
echo ""
sleep 1 && echo "Make sure you're connected to the internet, and enabled the Multilib repository."
echo ""
echo ""
sudo pacman -Syyu
sudo pacman -S pulseaudio alsa xorg-server xorg-xinit lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings papirus-icon-theme xterm budgie-desktop gnome-screensaver nautilus xdg-user-dirs-gtk firefox telegram-desktop kdenlive gnome-terminal 
echo ""
echo ""
sleep 1 && echo "Programs installed."
echo ""
echo ""
sleep 1 && echo "Enabling lightdm."
sudo startx && sudo systemctl enable lightdm
