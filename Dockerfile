FROM php:8.0-fpm-alpine

WORKDIR /var/www/backend

RUN docker-php-ext-install pdo pdo_mysql
