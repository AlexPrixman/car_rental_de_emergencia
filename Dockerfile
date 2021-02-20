#Imagen created for software exoneracion exam by Edgar Ventura
FROM alpine:3.11.6
WORKDIR /var/www/localhost/htdocs

RUN export phpverx=$(alpinever=$(cat /etc/alpine-release|cut -d '.' -f1);[ $alpinever -ge 9 ] && echo  7|| echo 5)

RUN apk update; \
  apk add --no-cache apache2 \
  php$phpverx-apache2 \
  apache2-proxy \
  apache2-ssl \
  apache2-utils \
  curl \
  unzip \
  gcc \
  musl-dev \
  libnsl \
  libaio \
  autoconf \
  make \
  tzdata

# Install all the php dependecies
RUN apk add php7-gd \ 
php7-mysqli \
php7-zlib \
php7-curl \
php7-pear \
php7-dev \
php7-openssl \
php7-pdo_mysql \
php7-mysqli \
php7-mcrypt \
php7-session \
php7-simplexml \
php7-json \
php7-xmlreader \
php7-imap \
php7-mbstring \
php7-phar \
php7-apcu \
php7-intl \
php7-opcache \
php7-xmlwriter


# Add my own php config.
RUN ln -sf /var/www/localhost/htdocs/env/cmc-php.ini /etc/php7/conf.d/
RUN ln -sf /var/www/localhost/htdocs/env/cmc-apache.conf /etc/apache2/conf.d/

RUN rm -rf /tmp/*.zip /var/cache/apk/* /tmp/oracle-sdk
RUN apk del unzip make curl

EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
