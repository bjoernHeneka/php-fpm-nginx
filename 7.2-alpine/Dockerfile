FROM php:7.2-fpm-alpine

MAINTAINER Jens Reinemuth <jens@reinemuth.info>

EXPOSE 80 443

ENV PHP_AMQP_VERSION=1.9.0

RUN apk add --update --no-cache \
    vim \
    curl \
    git \
    nginx \
    icu-dev \
    shadow \
    automake \
    make \
    gcc \
    g++ \ 
    libtool \
    autoconf \
    supervisor \
    rabbitmq-c \
    rabbitmq-c-dev \
    && docker-php-ext-install intl \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install exif \
    && pecl install amqp \
    && docker-php-ext-enable amqp

COPY ./docker/php/php.ini /usr/local/etc/php/php.ini
COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker/nginx/conf.d /etc/nginx/conf.d
COPY ./docker/supervisord.conf /etc/supervisord.conf

RUN chown 1000.1000 /var/www/html -R \
    && usermod -u 1000 www-data \
    && groupmod -g 1000 www-data

ENTRYPOINT ["/usr/bin/supervisord", "-n"]
