#!/bin/bash
sudo apt update && sudo apt-get -y install apache2 php libapache2-mod-php php-mysql php-curl php-gd php-intl mysql-server mysql-client ffmpeg git libimage-exiftool-perl php-mbstring php-gettext python && cd /var/www/html && sudo git clone https://github.com/WWBN/AVideo.git && sudo a2enmod rewrite && sudo phpenmod mbstring && sudo systemctl restart apache2
sudo sed -z 's/<Directory \/var\/www\/>\n\tOptions Indexes FollowSymLinks\n\tAllowOverride None/<Directory \/var\/www\/>\n\tOptions Indexes FollowSymLinks\n\tAllowOverride All/' -i /etc/apache2/apache2.conf
sudo a2enmod rewrite
sudo service apache2 restart
sudo mkdir /var/www/html/AVideo/videos
sudo chown www-data:www-data /var/www/html/AVideo/videos && sudo chmod 755 /var/www/html/AVideo/videos
sudo sed -z 's/post_max_size = 8M/post_max_size = 1000M/' -i /etc/php/7.2/apache2/php.ini
sudo sed -z 's/upload_max_filesize = 2M/upload_max_filesize = 1000M/'  -i /etc/php/7.2/apache2/php.ini
sudo service apache2 restart
echo done