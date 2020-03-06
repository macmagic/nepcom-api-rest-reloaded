FROM php:7.3-fpm-alpine

MAINTAINER juan-arroyes

RUN apk update \
    && apk add --no-cache \ 
    git \
    curl \
    icu-dev \
    libxml2-dev \
    g++ \
    libzip-dev \
    make \
    autoconf \
    && docker-php-source extract \
    && pecl install xdebug \
    ##&& docker-php-ext-enable xdebug \
    && docker-php-ext-install pdo_mysql soap intl zip \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && rm -rf /tmp/*

RUN wget https://cs.symfony.com/download/php-cs-fixer-v2.phar -O php-cs-fixer \
    && chmod a+x php-cs-fixer \
    && mv php-cs-fixer /usr/local/bin/php-cs-fixer

RUN cat /etc/group

RUN addgroup -g 1000 -S username && \
        adduser -u 1000 -S username -G username

USER 1000

WORKDIR /app

COPY . /app