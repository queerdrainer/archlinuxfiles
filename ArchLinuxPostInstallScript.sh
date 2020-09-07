#!/bin/sh

sleep 2 && echo "Installing required tools. Make sure you're connected to the Internet."
sleep 1 && sudo pacman -S xorg-server xorg-xinit xterm xfce4 lightdm pulseaudio telegram-desktop firefox vim
sleep 2 && echo "Install completed. (hopefully lmao)"
