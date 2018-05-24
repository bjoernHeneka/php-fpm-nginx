FROM bjoernheneka/php-fpm-nginx:7.2-alpine

MAINTAINER Jens Reinemuth <jens@reinemuth.info>

ENV PHP_AMQP_VERSION=1.9.0

RUN apk add --update --no-cache \
    automake \
    make \
    gcc \
    g++ \ 
    libtool \
    autoconf \
    supervisor \
    rabbitmq-c \
    rabbitmq-c-dev \
    && pecl install amqp \
    && docker-php-ext-enable amqp

