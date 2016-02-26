#!/usr/bin/env bash

# This script will install docker with machine and compose, create default VM, setup NFS share and redirect *.dev to default VM IP

sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for homebrew
if test ! $(which brew); then
  echo -n "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

echo -n "Installing docker, docker-machine and docker-compose"
brew install docker docker-machine docker-compose

echo -n "Installing docker-machine-nfs"
curl -s https://raw.githubusercontent.com/adlogix/docker-machine-nfs/master/docker-machine-nfs.sh |
  sudo tee /usr/local/bin/docker-machine-nfs > /dev/null && \
  sudo chmod +x /usr/local/bin/docker-machine-nfs

echo -n "Creating 'default' docker machine"
docker-machine create default

echo -n "Setting up nfs to replace vboxfs"
/usr/local/bin/docker-machine-nfs default

echo -n "Stating 'default' docker machine"
docker-machine start default

# Install dnsmasq
brew install dnsmasq

# Copy the default configuration file.
cp $(brew list dnsmasq | grep /dnsmasq.conf.example$) /usr/local/etc/dnsmasq.conf
# Copy the daemon configuration file into place.
sudo cp $(brew list dnsmasq | grep /homebrew.mxcl.dnsmasq.plist$) /Library/LaunchDaemons/
# Start Dnsmasq automatically.
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

# Register .dev tld
echo "" >> /usr/local/etc/dnsmasq.conf
echo "address=/dev/$(docker-machine ip default)" >> /usr/local/etc/dnsmasq.conf

# Restart dnsmasq service
sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq

# Create custom resolver config folder
sudo mkdir -p /etc/resolver

# Create custom entry for dev tld (So that only .dev is routed through dnsmasq)
sudo tee /etc/resolver/dev >/dev/null <<EOF
nameserver 127.0.0.1
EOF

echo -n "Stoping 'default' docker machine"
docker-machine stop default
