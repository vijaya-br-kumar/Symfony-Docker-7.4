From php:7.4-apache

RUN apt-get update

RUN apt-get install -y software-properties-common && apt-get update

RUN apt-get update && apt-get install -y vim nano git

RUN a2enmod headers

RUN a2enmod rewrite

# for mb-string
RUN apt-get install libonig-dev

RUN docker-php-ext-install mbstring && docker-php-ext-enable mbstring
# end

RUN apt-get update && apt-get install -y libzip-dev zip unzip \
    && docker-php-ext-install zip

RUN docker-php-ext-install pdo pdo_mysql

RUN apt-get install -y acl

RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
&& curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
# Make sure we're installing what we think we're installing!
&& php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
&& php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot \
&& rm -f /tmp/composer-setup.*

RUN apt-get install -y libicu-dev

RUN apt-get -y update \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

RUN apt-get install -y apt-transport-https ca-certificates wget

RUN wget https://get.symfony.com/cli/installer -O - | bash
