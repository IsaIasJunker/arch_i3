#!/bin/bash

# Propósito: Instalar i3-wm en arch linux 

componentes_i3=(
i3-wm
i3status
dmenu
alacritty
nano
)

cambiar_layaout(){
    sudo localectl set-keymap la-latin1
    sudo localectl set-x11-keymap latam
}

instalar_i3(){
    sudo pacman -S --noconfirm "${entorno[@]}"
}

instalar_aplicaciones(){
    sudo pacman -S --noconfirm "${aplicaciones[@]}"
}

main(){
    cambiar_layaout
    instalar_i3
}

main