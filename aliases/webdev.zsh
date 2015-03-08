# Webdev

if [ -f $(brew --prefix nginx)/homebrew.mxcl.nginx.plist ]
then
alias start-nginx="launchctl load $(brew --prefix nginx)/homebrew.mxcl.nginx.plist"
alias stop-nginx="launchctl unload $(brew --prefix nginx)/homebrew.mxcl.nginx.plist"
fi

if [ -f $(brew --prefix mysql)/homebrew.mxcl.mysql.plist ]
then
alias start-mysql="launchctl load $(brew --prefix mysql)/homebrew.mxcl.mysql.plist"
alias stop-mysql="launchctl unload $(brew --prefix mysql)/homebrew.mxcl.mysql.plist"
fi

if [ -f $(brew --prefix php56)/homebrew.mxcl.php56.plist ]
then
alias start-php-fpm="launchctl load $(brew --prefix php56)/homebrew.mxcl.php56.plist"
alias stop-php-fpm="launchctl unload $(brew --prefix php56)/homebrew.mxcl.php56.plist"
fi

alias start-webserver="start-nginx && start-mysql && start-php-fpm"
alias stop-webserver="stop-nginx && stop-mysql && stop-php-fpm"