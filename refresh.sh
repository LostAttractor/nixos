#!/bin/sh
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
rsync -a --exclude={'refresh.sh','.git'} /home/chaosattractor/nixos/* /etc/nixos/ -v
cd /etc/nixos/
nix flake update
nixos-rebuild switch
