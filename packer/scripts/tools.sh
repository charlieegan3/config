#!/bin/bash

set -x
set -e

cd $HOME

#heroku
curl https://toolbelt.heroku.com/install-ubuntu.sh | sh

# aws
apt-get -y install python-dev python-pip
pip install --upgrade pip
pip install awscli --upgrade --user

# tmux
curl -L https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz > /tmp/tmux.tar.gz
apt-get -y install libevent-dev ncurses-dev
tar xf /tmp/tmux.tar.gz
cd tmux-2.5
./configure && make
make install
cd ..
rm -rf tmux-2.5

# tfenv
export PATH="$PATH:$HOME/.tfenv/bin"
git clone https://github.com/kamatama41/tfenv.git ~/.tfenv && tfenv install latest

# packer
curl -o /tmp/packer.zip https://releases.hashicorp.com/packer/1.0.0/packer_1.0.0_linux_amd64.zip && \
  unzip /tmp/packer.zip && \
  mv packer /usr/local/bin

# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu yakkety stable \
  $(lsb_release -cs) \
  stable"
apt-get update >> /dev/null
apt-get -y install docker-ce
usermod -aG docker "$USER"

# postgres
apt-get install -y postgresql postgresql-contrib postgresql-client libpq-dev
PG_HBA=$(ls /etc/postgresql/*/main/pg_hba.conf | sort | tail -n 1)
sed -i.bak -e 's/peer\|md5/trust/g' "$PG_HBA"
/etc/init.d/postgresql restart
sudo -u postgres createuser "$(whoami)" || true
sudo -u postgres createdb "$(whoami)" || true
psql -U postgres -c "ALTER USER $(whoami) WITH SUPERUSER;"
