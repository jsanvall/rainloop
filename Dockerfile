FROM ubuntu:16.04

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -yqqq apache2 php wget unzip libapache2-mod-php php-curl php-xml

RUN rm -f /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/default-ssl.conf

COPY rainloop.conf /etc/apache2/sites-enabled/rainloop.conf
COPY ports.conf /etc/apache2/ports.conf
COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 8080
