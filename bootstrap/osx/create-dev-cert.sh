#!/usr/bin/env bash
echo -n "User password required to add certificate to local trust store."
sudo -v

openssl req \
  -new \
  -newkey rsa:2048 \
  -days 3650 \
  -nodes \
  -x509 \
  -subj "/C=BR/ST=RJ/L=Rio De Janeiro/O=Organization/OU=$(whoami)/CN=*.local.dev" \
  -keyout local.dev.key \
  -out local.dev.crt

sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain local.dev.crt
