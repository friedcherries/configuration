#!/usr/bin/env bash

echo Install all the apt components and any needed dependencies
sudo apt install -y build-essential
sudo apt install -y curl git kwrite 

# Install tailscale
app-installs/tailscale.sh login

# Install bashrc.d scripts
app-installs/rc-scrips.sh

# Install 1Password
app-installs/1password.sh

# Install Docker-ce.sh
app-installs/docker-ce.sh ${USER}

# Install localstack
app-installs/localstack.sh

# Install nvm
app-installs/nvm.sh

# Install pyenv
app-installs/pyenv.sh

# Install Visual Studio Code
app-installs/vscode.sh