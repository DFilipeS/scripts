#!/bin/bash

apt-get update

# Install terminator, zsh and git
apt-get install -y terminator zsh git build-essential

# Install Emacs
apt-get install -y emacs

# Install JDK 8
add-apt-repository -y ppa:webupd8team/java
apt-get update
apt-get install -y oracle-java8-installer

# Install PostgreSQL
apt-get install -y postgresql postgresql-contrib
sudo -u postgres -H sh -c "psql -c \"ALTER USER Postgres WITH PASSWORD 'postgres'\"";

# Install Docker
apt-get install -y curl linux-image-extra-$(uname -r) linux-image-extra-virtual apt-transport-https ca-certificates
curl -fsSL https://yum.dockerproject.org/gpg | apt-key add -
add-apt-repository -y "deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"
apt-get update
apt-get -y install docker-engine

# Install nvm and latest stable version of NodeJs
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
source ~/.bashrc
nvm install stable

# Install Elixir
wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
dpkg -i erlang-solutions_1.0_all.deb
rm erlang-solutions_1.0_all.deb
apt-get update
apt-get install -y esl-erlang elixir

# Install Visual Studio Code
wget -O vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
dpkg -i vscode.deb
rm vscode.deb

# Install Spotify
apt-key adv --keyserver -y hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | tee /etc/apt/sources.list.d/spotify.list
apt-get update
apt-get install --allow-unauthenticated -y spotify-client

# Install Slack
wget -O slack.deb https://downloads.slack-edge.com/linux_releases/slack-desktop-2.4.2-amd64.deb
dpkg -i slack.deb
rm slack.deb
