#!/usr/bin/env bash

# Check for homebrew
if test ! $(which brew); then
  echo -n "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

echo -n "Tapping into homebrew/dupes"
brew tap homebrew/dupes

echo -n "Tapping into homebrew/versions"
brew tap homebrew/versions

echo -n "Tapping into homebrew/homebrew-php"
brew tap homebrew/homebrew-php

echo -n "Installing PHP"
brew install php70

echo -n "Installing Curl with SSH and HTTP2 support."
brew install curl --with-libssh2 --with-nghttp2 --with-openssl

echo -n "Installing cask..."
brew install caskroom/cask/brew-cask

echo -n "Tapping into caskroom/versions"
brew tap caskroom/versions

# Apps
apps=(
  wp-cli
  flux
  plug
  torbrowser
  vyprvpn
  macs-fan-control
  github-desktop
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo -n "Installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# NPM packages
packages=(
  node-gyp
  peerflix
  pageres
  tmi
  gulp
  grunt-cli
  bower
  jscs
  jshint
  scss-lint
  csslint
)

echo -n "Installing npm extra packages..."
npm install -g ${packages[@]}
