#!/usr/bin/env bash

source /etc/os-release

if [ "${ID}" = "fedora" ]; then
    app-installs/docker-ce-fedora.sh
elif [ "${ID}" = "ubuntu" ]; then
    app-installs/docker-ce-ubuntu.sh
fi