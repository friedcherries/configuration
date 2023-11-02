#!/usr/bin/env bash

set -e

wget -qO vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
sudo apt install -y ./vscode.deb
rm -f vscode.deb