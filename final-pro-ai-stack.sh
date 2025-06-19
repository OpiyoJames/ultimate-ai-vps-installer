#!/bin/bash

# ===========================================================
# Ultimate AI VPS Business Stack - Final Full Auto Installer
# Author: OpiyoJames (with ChatGPT Assistant)
# ===========================================================

echo "🚀 Starting FULL AI BUSINESS STACK INSTALLATION..."

# Update and upgrade system
apt update && apt upgrade -y

# Install essential system packages
apt install -y git curl build-essential python3 python3-pip python3-venv nodejs npm unzip docker.io docker-compose redis-server postgresql postgresql-contrib ufw

# Add user to docker group
usermod -aG docker $USER

# Enable Redis & PostgreSQL to start on boot
systemctl enable redis-server
systemctl enable postgresql

# Start Redis & PostgreSQL immediately
systemctl start redis-server
systemctl start postgresql

# Prepare Python environment
python3 -m venv /opt/ai-agents
source /opt/ai-agents/bin/activate

# Install Python AI Agent stack
pip install --upgrade pip
pip install fastapi uvicorn pydantic openai transformers sentence-transformers pandas requests beautifulsoup4 aiohttp langchain llama-index streamlit gradio huggingface_hub celery redis sqlalchemy pymongo

# Disable venv for now
deactivate

# Install Certbot (extra SSL safety)
apt install certbot python3-certbot-nginx -y

# Fix Firewall rules
ufw disable
ufw reset
ufw allow OpenSSH
ufw allow 8083/tcp
ufw allow 80
ufw allow 443
ufw enable

# Clean up potential old package locks
rm -rf /var/lib/apt/lists/lock /var/cache/apt/archives/lock /var/lib/dpkg/lock*

# Final message
echo "✅ FULL INSTALLATION COMPLETE."
echo "👉 Now you can access HestiaCP and start building your full AI SaaS Business."
echo "👉 Your AI agents virtual environment is located at: /opt/ai-agents"

