#!/usr/bin/env bash

source /etc/os-release

if [ "${ID}" == "fedora" ]; then
    dnf list --installed 1password 2>&1 > /dev/null
    if [ $? == 1 ]; then
        echo Adding 1Password repository key
        sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc

        echo "Adding 1Password repository"
        sudo sh -c 'echo -e "[1password]\nname=1Password Stable Channel\nbaseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=\"https://downloads.1password.com/linux/keys/1password.asc\"" > /etc/yum.repos.d/1password.repo'

        echo "Installing 1Password"
         sudo dnf install -y 1password
    else
        echo "1password already installed"
    fi
elif [ "${ID}" == "ubuntu" ]; then
    CNT=$(apt-cache pkgnames 1password | wc -l | xargs)
    if [ $CNT -ne 0 ]; then
        echo 1Password already installed.
    else
        echo Adding 1Password apt repository key
        curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg

        echo Adding 1Password apt repository
        echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list

        echo Add the debsig-verify policy
        sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
        curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
        sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
        curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

        echo Install 1Password
        sudo apt-get update -y && sudo apt-get install -y 1password
    fi
fi