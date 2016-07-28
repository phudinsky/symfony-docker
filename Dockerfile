FROM php:5.6-fpm

RUN apt-get update && \
    apt-get install -y libmcrypt-dev libpq-dev netcat && \
    rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install \
        mcrypt \
        bcmath \
        mbstring \
        zip \
        opcache \
        mysqli \
        pdo pdo_mysql

RUN yes | pecl install xdebug-beta \
        && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
        && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
        && echo "xdebug.remote_autostart=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
        && echo "xdebug.remote_connect_back=on" >> /usr/local/etc/php/conf.d/xdebug.ini

COPY php/fpm_www.conf /usr/local/etc/php-fpm.d/www.conf
COPY php/symfony.ini /usr/local/etc/php/conf.d/
COPY ./boot.sh /srv/
COPY ./symfony /srv/symfony

WORKDIR /srv/
CMD ["bash", "boot.sh"]