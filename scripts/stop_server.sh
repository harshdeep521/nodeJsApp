#!/bin/bash
# stop_server.sh — Stop PM2 process if running

echo "---- Stopping existing PM2 process ----"

APP_NAME="nodeJsApp"

# Load nvm and node environment (important if using nvm)
export NVM_DIR="/home/ec2-user/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Check if PM2 is installed
if ! command -v pm2 &> /dev/null; then
  echo "PM2 not found, skipping stop step."
  exit 0
fi

# Stop and delete app if exists
pm2 delete "$APP_NAME" || echo "No PM2 process named $APP_NAME found."

# Save PM2 process list (optional)
pm2 save

echo "PM2 stop step completed."
