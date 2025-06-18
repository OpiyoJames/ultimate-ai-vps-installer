#!/bin/bash

# ========================
# ULTIMATE AI VPS INSTALLER
# Full Automated Installer for OpiyoJames
# ========================

echo "🚀 Starting full VPS AI installer..."

apt update && apt upgrade -y

apt install curl sudo git -y

wget https://raw.githubusercontent.com/hestiacp/hestiacp/release/install/hst-install.sh
bash hst-install.sh --nginx yes --apache no --phpfpm yes --named yes --mysql yes --postgresql no --vsftpd yes --exim yes --dovecot yes --clamav yes --spamassassin yes --iptables yes --fail2ban yes --quota no --interactive no

apt install python3 python3-pip python3-venv -y

curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt install -y nodejs

apt install certbot python3-certbot-nginx -y

apt install git -y

ufw allow OpenSSH
ufw allow 80
ufw allow 443
ufw allow 8083
ufw enable

echo "✅ FULL VPS INSTALLATION COMPLETE"
echo "👉 Now login to your Hestia Panel: https://YOUR_SERVER_IP:8083"
