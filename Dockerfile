FROM php:8.2-fpm
RUN apt-get update && apt-get install -y libpng-dev libjpeg62-turbo-dev libfreetype6-dev libxml2-dev zip unzip git curl
RUN docker-php-ext-install pdo_mysql gd
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
WORKDIR /app
COPY . /app
RUN composer install --no-interaction
CMD php artisan serve --host=0.0.0.0 --port=8000
EXPOSE 8000
