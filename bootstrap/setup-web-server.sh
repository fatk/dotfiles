echo "Installing php 5.6..."
brew install php56 --with-fpm --with-tidy
echo "Installing mysql..."
brew install mysql
echo "Installing nginx..."
brew install nginx --with-spdy --with-gunzip