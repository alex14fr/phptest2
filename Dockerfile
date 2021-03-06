FROM alpine:3.11

COPY . /usr/src/

RUN apk add --no-cache php7-cli php7-apache2 \
    php7-opcache php7-openssl php7-pdo php7-pdo_sqlite php7-session \
    php7-simplexml php7-sqlite3 php7-zip apache2 git \
	 libressl sqlite dropbear-scp dropbear-ssh ; \
	 mv /etc/apache2/httpd.conf /etc/apache2/httpd.conf.alpine ; \
	 mv /usr/src/httpd.conf /etc/apache2/ ; \
	 for i in languages userdir info; do \
		 mv /etc/apache2/conf.d/$i.conf /etc/apache2/conf.d/$i.conf.alpine ; \
	 done ; \
	 rm /var/www/logs ; \
	 rm -fr /var/log/apache2 ; \
	 mv /etc/php7/php.ini /etc/php7/php.ini.alpine ; \
	 mv /usr/src/php.ini /etc/php7/ ; \
	 mv /usr/src/femail /usr/sbin/sendmail ; \
	 mv /usr/src/* /var/www/localhost/htdocs ; \
	 chmod -R a+rwx /var/www ; \
	 chown -R apache /var/www ; \
	 chmod -R a+rwx /run ; \
	 mkdir /persist ; \
	 chmod -R a+rwx /persist ; \
	 echo "user:x:1000910000:0:my user:/persist:/sbin/nologin" >> /etc/passwd

WORKDIR /var/www/localhost/htdocs
EXPOSE 8080
CMD [ "./run" ]


