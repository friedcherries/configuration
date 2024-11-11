#!/usr/bin/env bash

dnf list --installed docker-ce 2>&1 > /dev/null
result=$?
if [ "$result" -ne 0 ]; then
    sudo dnf -y install dnf-plugins-core
    sudo dnf-3 config-manager -y --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
    sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo systemctl enable --now docker
else
    echo "Fuckity fuckity fuck"
fi