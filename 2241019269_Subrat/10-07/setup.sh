#!/bin/bash

# Update & install nginx
sudo apt update -y
sudo apt install nginx -y

# Replace default NGINX files
sudo rm -f /var/www/html/index.nginx-debian.html

# Copy custom HTML
sudo cp index.html /var/www/html/index.html
sudo cp error.html /var/www/html/error.html

# Start and enable nginx
sudo systemctl start nginx
sudo systemctl enable nginx

echo "✅ NGINX is installed and serving your custom page."

