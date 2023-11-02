#!/usr/bin/env bash

echo Download localstack
curl -Lo localstack-cli-2.3.0-linux-amd64-onefile.tar.gz https://github.com/localstack/localstack-cli/releases/download/v2.3.0/localstack-cli-2.3.0-linux-amd64-onefile.tar.gz

echo Install localstack
sudo tar xvzf localstack-cli-2.3.0-linux-*-onefile.tar.gz -C /usr/local/bin