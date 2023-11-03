#!/usr/bin/env bash

echo Bring system completely up to date
sudo apt-get update -q
sudo apt-get upgrade -qy

echo Install all the apt components and any needed dependencies
sudo apt-get install -qy build-essential
sudo apt-get install -qy curl git kwrite 

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

# Install nvm
app-installs/nvm.sh

# Install pyenv
app-installs/pyenv.sh

# Install Visual Studio Code
app-installs/vscode.sh