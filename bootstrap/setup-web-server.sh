echo "Installing php 5.6..."
brew install php56 --with-fpm --with-tidy
brew install php56-imagick php56-intl php56-crypto php56-mcrypt php56-opcache php56-tidy php56-yaml
echo "Installing mysql..."
brew install mysql
echo "Installing nginx..."
brew install nginx --with-spdy --with-gunzip
echo "Installing phpmyadmin..."
brew install phpmyadmin
