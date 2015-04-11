#!/usr/bin/env bash

echo "set -o vi" >> /home/vagrant/.bashrc

echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
add-apt-repository -y ppa:webupd8team/java
apt-get -qq update
apt-get -qq install -y oracle-java8-installer

mkdir -p /home/vagrant/dev/tools/bin
wget https://raw.github.com/technomancy/leiningen/stable/bin/lein -P /home/vagrant/dev/tools/bin
chmod a+x /home/vagrant/dev/tools/bin/lein
chown -R vagrant:vagrant /home/vagrant/dev

echo "export PATH=$PATH:/home/vagrant/dev/tools/bin" >> /home/vagrant/.bashrc