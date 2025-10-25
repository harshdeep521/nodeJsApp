#!/bin/bash
# install_dependencies.sh — Install Node.js, npm, dependencies, and PM2

echo "---- Installing dependencies ----"

APP_DIR="/home/ec2-user/nodeJsApp"
cd "$APP_DIR" || { echo "App directory not found!"; exit 1; }

# Load nvm (if installed)
export NVM_DIR="/home/ec2-user/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Ensure Node.js 18+ is installed
if ! command -v node &> /dev/null; then
  echo "Node.js not found! Installing Node.js 18..."
  curl -fsSL https://rpm.nodesource.com/setup_18.x | sudo -E bash -
  sudo yum install -y nodejs
fi

# Install PM2 globally if not installed
if ! command -v pm2 &> /dev/null; then
  echo "PM2 not found! Installing PM2..."
  sudo npm install -g pm2
fi

# Clean and install app dependencies
echo "Installing app dependencies..."
rm -rf node_modules
npm ci || npm install

echo "Dependencies and PM2 installed successfully."
