#!/bin/bash
echo "Updating and installing Apache..."
sudo apt-get update
sudo apt-get install -y apache2
sudo systemctl restart apache2

