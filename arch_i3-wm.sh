#!/bin/bash

# Propósito: Instalar i3-wm en arch linux 

componentes_i3=(
nano
i3-wm
i3status
alacritty
thunar
nwg-look
network-manager-applet
fastfetch
htop
bash-completion
rofi
polybar
ttf-meslo-nerd
)

# Cambio el layout del teclado a latam
cambiar_layaout(){
    sudo localectl set-keymap la-latin1
    sudo localectl set-x11-keymap latam
}
# Instalo lightmdm y habilito el servicio
instalar_display_manager(){
    sudo pacman -S --noconfirm lightdm-gtk-greeter
    sudo systemctl enable lightdm.service
}

# Instalo el arreglo de paquetes que tengo definido
instalar_i3(){
    sudo pacman -S --noconfirm "${componentes_i3[@]}"
}


copiar_i3_config(){
    mkdir -p ~/.config/i3
    cp -f ./i3/config ~/.config/i3/config
}

configurar_rofi(){
    mkdir -p ~/.config/rofi
    mv ./rofi/rofi/config.rasi ~/.config/rofi/
    mv ./rofi/rofi/catppuccin-mocha.rasi  ~/.config/rofi/
}

configurar_polybar(){
    mkdir -p ~/.config/polybar
    mv ./polybar/config.ini ~/.config/polybar/
    mv ./polybar/launch_polybar.sh ~/.config/polybar/
}

# Ejecuto de forma secuencial las funciones
main(){
    cambiar_layaout
    instalar_i3
    instalar_display_manager
    copiar_i3_config
    configurar_polybar
    configurar_rofi
}
main