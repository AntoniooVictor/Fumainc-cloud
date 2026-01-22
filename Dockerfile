FROM php:8.2-apache

# System Dependencies
RUN apt-get update && apt-get install -y \
    libzip-dev \
    zip \
    && docker-php-ext-install pdo pdo_mysql

# Enable Apache Rewrite
RUN a2enmod rewrite

# Copy Logic
COPY ./internal /var/www/html/

# Set Permissions
RUN chown -R www-data:www-data /var/www/html/uploads

# Expose Port
EXPOSE 80