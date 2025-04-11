#!/bin/bash

# Propósito: Instalar i3-wm en arch linux 

componentes_i3=(
nano
i3-wm
i3status
dmenu
alacritty
network-manager-applet
)

cambiar_layaout(){
    sudo localectl set-keymap la-latin1
    sudo localectl set-x11-keymap latam
}

instalar_display_manager(){
    sudo pacman -S lightdm-gtk-greeter
    sudo systemctl enable lightdm.service
}

instalar_i3(){
    sudo pacman -S --noconfirm "${componentes_i3[@]}"
}


main(){
    cambiar_layaout
    instalar_i3
    instalar_display_manager
}

main