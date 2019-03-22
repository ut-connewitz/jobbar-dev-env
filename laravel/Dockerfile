FROM php:7.2-apache

# install some basics
RUN apt-get update && apt-get install -y git zip

# install and enable php mysql
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli
RUN docker-php-ext-install pdo pdo_mysql

# enable apache mod_rewrite
RUN a2enmod rewrite

# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

# CMD ["apache2-foreground"]

# RUN apt-get update && apt-get install -y nodejs npm
# RUN npm install

RUN apt-get update || apt-get update
RUN apt-get install -y curl gnupg

RUN curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh

RUN apt install -y nodejs

COPY ./run.sh /
# ENTRYPOINT ["/run.sh"]

# RUN  useradd --shell /bin/bash -u 1024 -o -c "" -m myuser
# USER myuser