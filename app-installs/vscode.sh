#!/usr/bin/env bash

set -e

CNT=$(apt-cache pkgnames "code" | grep -e '^code$')
if [ $? -ne 0 ]; then
    wget -qO vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
    sudo apt install -y ./vscode.deb
    rm -f vscode.deb
else
    echo VSCode already installed
fi