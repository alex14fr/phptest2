FROM alpine:3.11
EXPOSE 8080

RUN apk add --no-cache php7-cli php7-apache2 php7-bz2 \
    php7-curl php7-opcache php7-openssl php7-pdo php7-pdo_sqlite php7-session \
    php7-simplexml php7-sqlite3 php7-zip apache2 wget git perl ghostscript

COPY ./femail /usr/bin
RUN rm femail

WORKDIR /usr/src/myapp

CMD [ "php", "-S", "0.0.0.0:8080" ]
