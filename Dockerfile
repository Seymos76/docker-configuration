ARG PHP_VERSION=8.0

FROM php:${PHP_VERSION}-fpm-alpine

# update & install requirements
RUN apk --no-cache update && apk --no-cache add bash curl

# install composer
#RUN curl -sSk https://getcomposer.org/installer | php -- --disable-tls && mv composer.phar /usr/local/bin/composer

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php && php -r "unlink('composer-setup.php');" && mv composer.phar /usr/local/bin/composer 

# install Symfony CLI
RUN wget https://get.symfony.com/cli/installer -O - | bash && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

# export symfony executable path
RUN export PATH="$HOME/.symfony/bin:$PATH"

# set working
WORKDIR /var/www/html

#RUN curl --ipv4 'https://packagist.org/packages.json'