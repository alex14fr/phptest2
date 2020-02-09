FROM alpine:3.11

COPY . /usr/src/

RUN apk add --no-cache php7-cli php7-apache2 php7-bz2 \
    php7-curl php7-opcache php7-openssl php7-pdo php7-pdo_sqlite php7-session \
    php7-simplexml php7-sqlite3 php7-zip apache2 git perl \
	 ghostscript openssl ; \
	 mv /etc/apache2/httpd.conf /etc/apache2/httpd.conf.alpine ; \
	 mv /usr/src/httpd.conf /etc/apache2/ ; \
	 rm /var/www/logs ; \
	 mkdir /var/www/logs ; \
	 touch /var/www/logs/access.log /var/www/logs/error.log ; \
	 mv /etc/php7/php.ini /etc/php7/php.ini.alpine ; \
	 mv /usr/src/php.ini /etc/php7/ ; \
	 mv /usr/src/femail /usr/sbin/sendmail ; \
	 mv /usr/src/* /var/www/localhost/htdocs ; \
	 chmod -R a+rwx /var/www ; \
	 chown -R apache /var/www ; \
	 chmod -R a+rwx /run

WORKDIR /var/www/localhost/htdocs
EXPOSE 8080
CMD [ "run" ]


