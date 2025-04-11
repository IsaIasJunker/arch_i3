#!/bin/bash

# Propósito: Instalar i3-wm en arch linux 

componentes_i3=(
i3-wm
i3status
dmenu
alacritty
nano
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


cambiar_layaout(){
    sudo localectl set-keymap la-latin1
    sudo localectl set-x11-keymap latam
}

instalar_yay (){
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm --needed base-devel git
    git clone https://aur.archlinux.org/yay.git
    cd ./yay 
    makepkg -si
}

instalar_i3(){
    sudo pacman -S --noconfirm "${entorno[@]}"
}

instalar_aplicaciones(){
    sudo pacman -S --noconfirm "${aplicaciones[@]}"
}

instalar_sddm(){
    sudo pacman -S --noconfirm sddm

    sudo systemctl enable sddm.service
}
    
main(){
    actualizar
    cambiar_layaout
    instalar_yay
    instalar_i3
    instalar_sddm
}

main