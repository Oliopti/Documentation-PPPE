#!/bin/bash

# Code rédigé par Olivier JOURDAIN le 09/06/2023

# Installation d'Apache2
echo -e "\033[1;32mInstallation d'Apache2\033[0m"
sudo apt-get install apache2 -y
echo -e "\033[1;36mInstallation d'Apache2 et configuration terminée.\033[0m"


# Installation de PHP
echo -e "\033[1;32mInstallation de PHP\033[0m"
sudo apt-get install php -y
echo -e "\033[1;36mInstallation de PHP et configuration terminée.\033[0m"

# Installation de MariaDB
echo -e "\033[1;32mInstallation de MariaDB\033[0m"
sudo apt-get install mariadb-server mariadb-client -y
echo -e "\033[1;36mInstallation de MariaDB et configuration terminée.\033[0m"

# Création d'un lien symbolique pour accéder à phpMyAdmin via le navigateur
echo -e "\033[1;32mCréation d'un lien symbolique pour accéder à phpMyAdmin via le navigateur\033[0m"
sudo ln -s /usr/share/phpmyadmin /var/www/html

# Installation de phpMyAdmin
echo -e "\033[1;32mInstallation de phpMyAdmin\033[0m"
sudo apt-get install phpmyadmin -y
echo -e "\033[1;36mInstallation de phpMyAdmin et configuration terminée.\033[0m"

# Redémarrage d'Apache2
echo -e "\033[1;32mRedémarrage d'Apache2\033[0m"
sudo systemctl restart apache2
echo -e "\033[1;36mRedémarrage d'Apache2 terminé.\033[0m"

echo -e "\033[0;35mInstallation de Apache2, PHP, MariaDB et phpMyAdmin terminée.\033[0m"


echo -e "\033[0;35mExecutez 'sudo systemctl status apache2' ou 'sudo systemctl status mariadb' pour connaître le satus de Apache 2 ou MariaDB .\033[0m"

