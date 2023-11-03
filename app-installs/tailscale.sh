#!/usr/bin/env bash

set -e

which tailscale > /dev/null
if [ $? -ne 0 ]; then

    source /etc/os-release

    echo Install Tailscale signing key and repository
    curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/${UBUNTU_CODENAME}.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
    curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/${UBUNTU_CODENAME}.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list

    echo Install Tailscale
    sudo apt-get -q update -y
    sudo apt-get -q install -y tailscale
    sudo tailscale up
else
    echo Tailscale already installed
fi