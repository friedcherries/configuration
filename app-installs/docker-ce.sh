#!/usr/bin/env bash

set -e

LATEST_SUPPORTED_UBUNTU=lunar

if [ "" != "${1}" ]; then
    USER=${1}
fi

CNT=$(apt-cache pkgnames docker-ce | wc -l | xargs)
if [ $CNT -ne 0 ]; then
    echo Docker already installed
else
    echo Add Docker GPG key
    sudo apt update -y
    sudo apt install -y ca-certificates curl gnupg
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg

    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable"   | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update -y

    echo Install Docker
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    if [ "" != "${USER}" ]; then
        echo Make Docker insecure
        sudo groupadd docker
        sudo usermod -aG docker $USER
    fi
fi