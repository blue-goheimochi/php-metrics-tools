FROM php:8.3-cli

WORKDIR /tmp

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_NO_INTERACTION 1

RUN apt-get update
RUN apt-get install -y wget git unzip python3 python3-pip libyaml-dev

COPY php.ini /usr/local/etc/php/

RUN pecl install yaml && docker-php-ext-enable yaml

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    chmod +x composer.phar && \
    mv composer.phar /usr/local/bin/composer

ENV PATH="/root/.composer/vendor/bin:${PATH}"

RUN wget https://phar.phpunit.de/phpcpd.phar && \
    chmod +x phpcpd.phar && \
    mv phpcpd.phar /usr/local/bin/phpcpd

COPY requirements.txt /tmp/
RUN pip install -r requirements.txt --break-system-packages

COPY composer.json /root/.composer/
COPY composer.lock /root/.composer/
WORKDIR /root/.composer
RUN composer install

WORKDIR /app
