#!/usr/bin/env bash
source /etc/os-release

if [ "${ID}" == "fedora" ]; then
    dnf list --installed code
    if [ $? -eq 1 ]; then
        sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
        echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
        dnf check-update
        sudo dnf install code # or code-insiders
    else
        echo VSCode already installed
    fi
elif [ "${ID}" == "ubuntu" ]; then
    CNT=$(apt-cache pkgnames "code" | grep -e '^code$')
    if [ $? -ne 0 ]; then
        wget -qO vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
        sudo apt install -y ./vscode.deb
        rm -f vscode.deb
    else
        echo VSCode already installed
    fi
fi