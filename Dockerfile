FROM alpine:3.11

COPY . /usr/src/

EXPOSE 8080

RUN apk add --no-cache php7-cli php7-apache2 php7-bz2 \
    php7-curl php7-opcache php7-openssl php7-pdo php7-pdo_sqlite php7-session \
    php7-simplexml php7-sqlite3 php7-zip apache2 wget git perl ghostscript openssl

WORKDIR /usr/src
RUN mv /etc/apache2/httpd.conf /etc/apache2/httpd.conf.alpine
RUN mv /usr/src/httpd.conf /etc/apache2/
RUN rm /var/www/logs
RUN mkdir /var/www/logs
RUN touch /var/www/logs/access.log /var/www/logs/error.log
RUN mv /etc/php7/php.ini /etc/php7/php.ini.alpine
RUN mv /usr/src/php.ini /etc/php7/
RUN mv /usr/src/femail /usr/sbin/sendmail
RUN mv /usr/src/* /var/www/localhost/htdocs
RUN chmod -R a+rwx /var/www
RUN chown -R apache /var/www

CMD [ "httpd", "-D", "FOREGROUND" ]


