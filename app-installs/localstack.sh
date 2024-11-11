#!/usr/bin/env bash

install=0
GLOBAL_RELEASE_TAG=$(basename $(curl -vs https://github.com/localstack/localstack/releases/latest 2>&1 | grep 'location' | sed 's/<\ location\:\ //g'))
GLOBAL_RELEASE_TAG="${GLOBAL_RELEASE_TAG%%[[:cntrl:]]}"
GLOBAL_RELEASE=$(echo $GLOBAL_RELEASE_TAG | sed 's/^v//')

which localstack 2>&1 > /dev/null

if [ $? -ne 0 ]; then
    install=1
else
    echo Localstack already installed - comparing versions
    local_version=$(localstack --version | xargs)

    if [ "${local_version}" != "${GLOBAL_RELEASE}" ]; then
        install=1
        echo "Upgrading to ${GLOBAL_RELEASE_TAG}"
    else
        echo "Localstack version up to date"
    fi
fi

if [ $install -eq 1 ]; then

    URL="https://github.com/localstack/localstack-cli/releases/download/VERSION_TAG/localstack-cli-RELEASE_TAG-linux-amd64-onefile.tar.gz"
    URL=$(echo ${URL} | sed "s/VERSION_TAG/${GLOBAL_RELEASE_TAG}/g")
    URL=$(echo ${URL} | sed "s/RELEASE_TAG/${GLOBAL_RELEASE}/g")

    echo Downloading localstack
    curl -Lo localstack-cli.tar.gz ${URL}

    echo Installing localstack ${GLOBAL_RELEASE_TAG}
    sudo tar xvzf localstack-cli.tar.gz -C /usr/local/bin
    rm localstack-cli.tar.gz
fi