#!/bin/bash

# Propósito: Instalar i3-wm en arch linux 

componentes_i3=(
nano
i3-wm
i3status
dmenu
alacritty
thunar
nwg-look
network-manager-applet
fastfetch
htop
)

# Cambio el layout del teclado a latam
cambiar_layaout(){
    sudo localectl set-keymap la-latin1
    sudo localectl set-x11-keymap latam
}
# Instalo lightdm y lo habilito
instalar_display_manager(){
    sudo pacman -S lightdm-gtk-greeter
    sudo systemctl enable lightdm.service
}

# Instalo el arreglo de paquetes que tengo definido
instalar_i3(){
    sudo pacman -S --noconfirm "${componentes_i3[@]}"
}

# Instalo el helper yay
instalar_yay(){
    sudo pacman -S --noconfirm --needed base-devel
    git -C $HOME clone https://aur.archlinux.org/yay.git
    cd $HOME/yay/
    makepkg -si 
}

# Ejecuto de forma secuencial las funciones
main(){
    cambiar_layaout
    instalar_i3
    instalar_display_manager
    instalar_yay
}

main