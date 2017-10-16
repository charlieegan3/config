#!/bin/bash

set -x
set -e

cd $HOME

# configure firewall
ufw default deny
ufw allow ssh
echo y | ufw enable

# set password
echo "charlieegan3:$PASSWORD" | sudo chpasswd
