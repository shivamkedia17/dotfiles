#!/bin/bash

git clone https://github.com/shivamkedia17/dotfiles.git ~/dotfiles
mkdir -p ~/docker/wireguard
cp ~/dotfiles/setup_scripts/docker-compose.yml ~/docker/wireguard
cd ~/docker/wireguard

sudo docker compose up
# To show QR code: 'docker exec -it wireguard /app/show-peer 1 2 3'
