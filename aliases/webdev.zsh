# Webdev

alias start-nginx="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist"
alias start-mysql="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias start-php-fpm="launchctl load ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"

alias stop-nginx="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist"
alias stop-mysql="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist"
alias stop-php-fpm="launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.php56.plist"

alias start-webserver="start-nginx && start-mysql && start-php-fpm"
alias stop-webserver="stop-nginx && stop-mysql && stop-php-fpm"