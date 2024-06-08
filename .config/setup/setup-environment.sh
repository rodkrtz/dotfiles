#!/bin/bash

# Saia imediatamente se um comando falhar
set -e

# Instale pacotes usando pacman
sudo pacman -S --noconfirm --needed \
    gnome \
    networkmanager \
    git \
    fish \
    vim \
    ttf-jetbrains-mono-nerd \
    starfish \
    kitty

# Habilite e inicie o serviço GDM
sudo systemctl enable gdm.service
sudo systemctl start gdm.service

# Habilite e inicie o serviço NetworkManager
sudo systemctl enable NetworkManager.service
sudo systemctl start NetworkManager.service

# Adicione o Fish ao arquivo /etc/shells se não estiver presente
if ! grep -q "$(which fish)" /etc/shells; then
    echo "$(which fish)" | sudo tee -a /etc/shells
fi

# Defina o Fish como o shell padrão para o usuário atual
chsh -s "$(which fish)"

# Mensagem de conclusão
echo "Done!"
