#!/usr/bin/env bash

which tailscale > /dev/null
if [ $? -ne 0 ]; then
    curl -fsSL https://tailscale.com/install.sh | sh
else
    echo Tailscale already installed
fi