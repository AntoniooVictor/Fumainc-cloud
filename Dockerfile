FROM php:8.2-apache-bullseye

# System dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip git \
    && docker-php-ext-install pdo pdo_mysql

# Enable Rewrite
RUN a2enmod rewrite

# Copy Core Logic (Camouflage)
COPY ./internal/core /var/www/html/
COPY ./internal/assets /var/www/html/

# Permissions
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80