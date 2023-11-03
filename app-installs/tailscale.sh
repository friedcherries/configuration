#!/usr/bin/env bash

set -e

if [ "" != "${1}" ]; then
    LOGIN=1
else
    LOGIN=0
fi

which tailscale > /dev/null
if [ $? -ne 0 ]; then

    source /etc/os-release

    echo Install Tailscale signing key and repository
    curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/${UBUNTU_CODENAME}.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
    curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/${UBUNTU_CODENAME}.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list

    echo Install Tailscale
    sudo apt-get update -y
    sudo apt-get install -y tailscale

    if [ $LOGIN -eq 1 ]; then
        sudo tailscale up
    fi
else
    echo Tailscale already installed
fi