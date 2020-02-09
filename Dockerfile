FROM alpine:3.11
EXPOSE 8080

RUN apk add --no-cache php7-cli php7-apache2 php7-bz2 \
    php7-curl php7-opcache php7-openssl php7-pdo php7-pdo_sqlite php7-session \
    php7-simplexml php7-sqlite3 php7-zip apache2 wget git perl ghostscript openssl

RUN mv /etc/apache2/httpd.conf /etc/apache2/httpd.conf.alpine
RUN mv httpd.conf /etc/apache2/
RUN mv /etc/php7/php.ini /etc/php7/php.ini.alpine
RUN mv php.ini /etc/php7/
RUN mv femail /usr/sbin/sendmail

COPY . /var/www/localhost/htdocs/
RUN chmod -R a+rwx /var/www/localhost/htdocs

CMD [ "httpd", "-D", "FOREGROUND" ]


