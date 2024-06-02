#!/bin/bash

# configurar o pacman
sudo sed -i 's/^#Color/Color/g; s/^#CheckSpace/CheckSpace/g; s/^#ParallelDownloads/ParallelDownloads/g;' /etc/pacman.conf

# ordenar repositorios por velocidade de resposta
sudo pacman -Syy reflector --needed --noconfirm
sudo reflector --verbose --country Brazil --score 100 --fastest 50 --sort rate --save /etc/pacman.d/mirrorlist

# atualizar o sistema
sudo pacman -Syyu base-devel git --needed --noconfirm

# instalar o yay
if pacman -Qs yay > /dev/null ; then
   echo "yay já instalado"
else
   git clone https://aur.archlinux.org/yay.git
   cd yay
   makepkg -si --noconfirm
   cd ..
   rm -rf yay
fi

# instalar pacotes
sudo pacman -S vim net-tools zip unzip tar unrar curl wget cronie xorg xorg-xinit openbox thunar xterm slim tint2 networkmanager network-manager-applet ttf-dejavu ttf-liberation firefox --needed --noconfirm

# configurar o xinit
cp files/home/user/_xinitrc ~/.xinitrc
chmod +x ~/.xinitrc

# configurar o openbox
mkdir -p ~/.config/openbox
cp files/home/user/_config/openbox/* ~/.config/openbox/

# habilitar o slim
sudo systemctl enable slim

