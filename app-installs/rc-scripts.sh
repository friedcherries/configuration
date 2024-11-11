#!/usr/bin/env bash
local_shell=$(basename $SHELL)

if [ "${local_shell}" == "bash" ]; then
    rc_file=".bashrc"
elif [ "${local_shell}" == "zsh" ]; then
    rc_file=".zshrc"
else
    rc_file=".profile"
fi


if [ ! -d ${HOME}/.shrc.d ]; then
    echo Install bashrc.d scripts
    mkdir -p ${HOME}/.shrc.d
    cp shrc.d/*.sh ${HOME}/.shrc.d
    cat >> ${HOME}/${rc_file} <<- EOM
for file in \$(ls \${HOME}/.shrc.d/*.sh); do
    source \${file};
done
EOM
else
    echo bashrc.d scripts already installed
fi