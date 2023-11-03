#!/usr/bin/env bash

set -e

if [ ! -d "${HOME}/.nvm/.git" ]; then
    echo Install nvm
    PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'
else
    echo nvm installed
fi
