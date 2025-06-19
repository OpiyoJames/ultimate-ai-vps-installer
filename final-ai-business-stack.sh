sudo apt update && sudo apt upgrade -y
sudo apt install -y python3 python3-pip python3-venv git curl build-essential docker.io docker-compose nodejs npm redis-server ufw certbot python3-certbot-nginx

# Start and enable services
sudo systemctl enable redis-server
sudo systemctl start redis-server

# Setup firewall
sudo ufw disable && sudo ufw reset && sudo ufw allow OpenSSH && sudo ufw allow 8083/tcp && sudo ufw allow 80 && sudo ufw allow 443 && sudo ufw enable

# Install full Python AI Agent stack
python3 -m venv /opt/ai-agents
source /opt/ai-agents/bin/activate
pip install --upgrade pip
pip install fastapi uvicorn pydantic openai transformers sentence-transformers pandas requests beautifulsoup4 aiohttp langchain llama-index streamlit gradio huggingface_hub celery redis sqlalchemy pymongo
