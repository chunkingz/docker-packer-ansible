sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install nginx -y
sudo systemctl enable nginx
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw enable
