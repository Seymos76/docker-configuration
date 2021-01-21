ARG PHP_VERSION=7.2
ARG NGINX_VERSION=1.18

FROM php:${PHP_VERSION}-fpm-alpine AS app_php

# update & install requirements
RUN apk --no-cache update && apk --no-cache add \
    bash \
    git \
    vi \
    curl \
    libicu-dev \
    sudo

# install php extensions
# RUN docker-php-ext-install pdo_mysql intl gd


# install composer
# RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
# RUN php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer 

# install Symfony CLI
# RUN wget https://get.symfony.com/cli/installer -O - | bash && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

# export symfony executable path
# RUN export PATH="$HOME/.symfony/bin:$PATH"

# set working
# WORKDIR /www/symfony

# COPY . /www/symfony

# RUN sudo chown -R 1000:1000 /www/symfony && sudo chmod -R 770 /www/symfony/var/cache && sudo chmod -R 770 /www/symfony/var/log

# CMD composer update