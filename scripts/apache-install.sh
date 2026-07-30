#!/bin/bash

echo "Updating packages..."

sudo yum update -y

echo "Installing Apache..."

sudo yum install httpd -y

echo "Starting Apache..."

sudo systemctl start httpd

echo "Enabling Apache..."

sudo systemctl enable httpd

echo "<h1>AWS Multi-Tier Web Application</h1>" | sudo tee /var/www/html/index.html

echo "Deployment Complete."
