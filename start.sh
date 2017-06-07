#!/bin/bash

if [ ! -f /opt/rainloop/rainloop-community-latest.zip ]
then
	mkdir -p /opt/rainloop
	wget http://www.rainloop.net/repository/webmail/rainloop-community-latest.zip -O /opt/rainloop/rainloop-community-latest.zip
	unzip /opt/rainloop/rainloop-community-latest.zip -d /opt/rainloop/

	chown -R www-data:www-data /opt/rainloop
	find /opt/rainloop/ -type d -exec chmod 755 {} \;
	find /opt/rainloop/ -type f -exec chmod 644 {} \;
fi


/usr/sbin/apache2ctl -D FOREGROUND
