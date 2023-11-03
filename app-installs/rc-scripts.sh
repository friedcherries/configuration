#!/usr/bin/env bash

if [ ! -d ${HOME}/.bashrc.d ]; then
    echo Install bashrc.d scripts
    mkdir -p ${HOME}/.bashrc.d
    cp bashrc.d/*.bashrc ${HOME}/.bashrc.d
    cat >> ${HOME}/.bashrc <<- EOM
for file in \$(ls \${HOME}/.bashrc.d/*.bashrc); do
    source \${file};
done
EOM
    source ${HOME}/.bashrc
else
    echo bashrc.d scripts already installed
fi