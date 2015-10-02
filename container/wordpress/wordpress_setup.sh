#!/bin/bash

cp /benchmarks/container/wordpress/000-default.conf /etc/apache2/sites-available/000-default.conf
cp /benchmarks/container/wordpress/start_apache2.sh /etc/apache2/start_apache2.sh
rm -rf /var/www/
wget http://wordpress.org/latest.tar.gz
tar xvzf latest.tar.gz
mv wordpress /var/www/
chown -R www-data:www-data /var/www/


