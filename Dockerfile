FROM php:7.4-fpm-alpine

RUN docker-php-ext-install pdo pdo_mysql
RUN apk add autoconf
RUN apk add build-base
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN pecl install xdebug \
  && docker-php-ext-enable xdebug