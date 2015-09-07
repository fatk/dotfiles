# Check for homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Install PHP
brew tap homebrew/homebrew-php

binaries=(
  webkit2png
  trash
  node
  hub
  grc
)

echo "Installing binaries..."
brew install ${binaries[@]}

echo "Installing cask..."
brew install caskroom/cask/brew-cask

echo "Tapping into caskroom/versions"
brew tap caskroom/versions

# Apps
apps=(
  dropbox
  google-chrome
  qlcolorcode
  screenflick
  slack
  appcleaner
  firefox
  qlmarkdown
  spotify
  flash
  iterm2
  qlprettypatch
  sublime-text3
  atom
  airmail-beta
  qlstephen
  vlc
  mplayerx
  quicklook-json
  skype
  transmission
  evernote
  the-unarchiver
  xtrafinder
  imageoptim
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

