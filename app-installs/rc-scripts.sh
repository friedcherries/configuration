#!/usr/bin/env bash

echo Checking tailscale status
tailscale status > /dev/null
if [ $? -ne 0 ]; then
    echo Tailscale is not up and running. You need to setup tailscale and auth before continuing.
    exit 66
fi

echo Install bashrc.d scripts
mkdir -p ${HOME}/.bashrc.d
scp hoth:deploy/homedir/.bashrc.d/* ${HOME}/.bashrc.d
cat >> ${HOME}/.bashrc <<- EOM
for file in \$(ls \${HOME}/.bashrc.d/\*.bashrc); do
    source \${file};
done
EOM