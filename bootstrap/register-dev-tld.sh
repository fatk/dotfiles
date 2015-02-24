# This script will install dnsmasq and redirect *.dev to localhost

sudo -v

# Update your homebrew installation
brew up
# Install dnsmasq
brew install dnsmasq

# Copy the default configuration file.
cp $(brew list dnsmasq | grep /dnsmasq.conf.example$) /usr/local/etc/dnsmasq.conf
# Copy the daemon configuration file into place.
sudo cp $(brew list dnsmasq | grep /homebrew.mxcl.dnsmasq.plist$) /Library/LaunchDaemons/
# Start Dnsmasq automatically.
sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist

# Register .dev tld
echo "" >> /usr/local/etc/dnsmasq.conf
echo "address=/dev/127.0.0.1" >> /usr/local/etc/dnsmasq.conf

# Restart dnsmasq service
sudo launchctl stop homebrew.mxcl.dnsmasq
sudo launchctl start homebrew.mxcl.dnsmasq

# Create custom resolver config folder
sudo mkdir -p /etc/resolver

# Create custom entry for dev tld (So that only .dev is routed through dnsmasq)
sudo tee /etc/resolver/dev >/dev/null <<EOF
nameserver 127.0.0.1
EOF