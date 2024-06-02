#!/bin/bash

# configurar o pacman
sudo sed -i 's/^#Color/Color/g; s/^#CheckSpace/CheckSpace/g; s/^#ParallelDownloads/ParallelDownloads/g;' /etc/pacman.conf

# ordenar repositorios por velocidade de resposta
sudo pacman -Syy reflector --needed --noconfirm
sudo reflector --verbose --country Brazil --score 100 --fastest 50 --sort rate --save /etc/pacman.d/mirrorlist

# atualizar o sistema
sudo pacman -Syyu base-devel git --needed --noconfirm

# instalar o yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# instalar pacotes
sudo pacman -S vim net-tools zip unzip tar unrar curl wget cronie xorg xorg-xinit openbox thunar xterm slim tint2 networkmanager network-manager-applet ttf-dejavu ttf-liberation --needed --noconfirm

# configurar o xinit
# cp config/_xinitrc ~/.xinitrc

# configurar o openbox
mkdir -p ~/.config/openbox

# habilitar do slim
sudo systemctl enable slim
