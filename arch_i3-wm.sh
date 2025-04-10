#!/bin/bash

# Propósito: Instalar i3-wm en arch linux 

entorno=(
i3-wm
i3status
dmenu
alacritty
sddm
)

aplicaciones=(
firefox
gedit
nwg-look
nitrogen
thunar
ranger
htop
fastfetch
libreoffice-still    
)

actualizar(){
    sudo pacman -S --noconfirm
}

instalar_yay (){
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm --needed base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd ./yay 
    makepkg -si
}

instalar_entorno(){
    sudo pacman -S --noconfirm "${entorno[@]}"
}

instalar_aplicaciones(){
    sudo pacman -S --noconfirm "${aplicaciones[@]}"
}

activar_sddm(){
    sudo systemctl enable sddm.service
}
    
main(
    actualizar
    instalar_yay
    instalar_entorno
    instalar_aplicaciones
    activar_sddm
)


main