#!/usr/bin/env bash

which pyenv > /dev/null

if [ $? -ne 0 ]; then
    echo Instally pyenv
    curl https://pyenv.run | bash
else
    echo pyenv already installed
fi