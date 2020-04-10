#!/usr/bin/env bash
echo "User password required to add certificate to local trust store."
sudo -v

openssl req \
    -newkey rsa:2048 \
    -x509 \
    -nodes \
    -keyout local.dev.key \
    -new \
    -out local.dev.crt \
    -subj "/C=BR/ST=RJ/L=Rio De Janeiro/O=Organization/OU=$(whoami)/CN=*.local.dev" \
    -reqexts SAN \
    -extensions SAN \
    -config <(cat /System/Library/OpenSSL/openssl.cnf \
        <(printf '[SAN]\nsubjectAltName=DNS:*.local.dev')) \
    -sha256 \
    -days 3650

sudo security add-trusted-cert -d -r trustRoot -k /Library/Keychains/System.keychain local.dev.crt
