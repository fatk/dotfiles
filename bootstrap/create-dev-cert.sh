sudo -v

mkdir -p $(brew --prefix)/etc/nginx/ssl
chmod o-rwx $(brew --prefix)/etc/nginx/ssl


openssl req \
  -new \
  -newkey sha512:2048 \
  -days 3650 \
  -nodes \
  -x509 \
  -subj "/C=BR/ST=RJ/L=Rio De Janeiro/O=Organization/OU=$(whoami)/CN=*.local.dev" \
  -keyout $(brew --prefix)/etc/nginx/ssl/\*.local.dev.key \
  -out $(brew --prefix)/etc/nginx/ssl/\*.local.dev.crt

sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain $(brew --prefix)/etc/nginx/ssl/\*.local.dev.crt
