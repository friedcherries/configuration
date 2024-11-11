#!/usr/bin/env bash

# Get our OS Specific Environment Variables
source /etc/os-release

echo Bring system completely up to date and install all any additional packages
if [ "${ID}" == "fedora" ]; then
    pkg_tool=dnf
    sudo dnf upgrade -y
    sudo dnf install -y @development-tools @development-libs
elif [ "${ID}" == "ubuntu" ]; then
    pkg_tool=apt-get
    sudo apt-get update -y
    sudo apt-get upgrade -y
    sudo apt-get install -y build-essential
    sudo apt-get install -y vim curl git kwrite
else
    echo "These scripts only support Fedora and Ubuntu"
    exit
fi

if [ "${ID}" == "ubunutu" ]; then
    sudo ${pkg_tool} upgrade -y
fi

echo Install all the apt components and any needed dependencies
sudo ${pkg_tool} install -y vim curl git kwrite
exit

# Install tailscale
app-installs/tailscale.sh

# Install bashrc.d scripts
app-installs/rc-scripts.sh

# Install 1Password
app-installs/1password.sh

# Install Docker-ce.sh
app-installs/docker-ce.sh ${USER}

# Install localstack
app-installs/localstack.sh

# Install Visual Studio Code
app-installs/vscode.sh

# Install nvm
app-installs/nvm.sh

# Install pyenv - pyenv has to be last because of how the script functions
app-installs/pyenv.sh
