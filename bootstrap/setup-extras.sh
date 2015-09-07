# Check for homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

extras=(
    phpmyadmin
)

echo "Installing extras..."
brew install ${extras[@]}

echo "Installing cask..."
brew install caskroom/cask/brew-cask

echo "Tapping into caskroom/versions"
brew tap caskroom/versions

# Apps
apps=(
  wp-cli
  flux
  plug
  torbrowser
  trim-enabler
  vyprvpn
  macs-fan-control
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# NPM packages
packages=(
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

echo "installing npm extra packages..."
npm install -g ${packages[@]}
