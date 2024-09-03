#!/bin/bash
echo "Updating and installing Apache..."
sudo apt-get update
sudo apt-get install -y apache2
echo "<html><body><h1>Hello World</h1></body></html>" | sudo tee /var/www/html/index.html
sudo systemctl restart apache2

