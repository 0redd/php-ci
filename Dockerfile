FROM php:7.1

MAINTAINER Reda Balkouch

# Update packages and install composer and PHP dependencies.
RUN apt-get update -yqq && \
    apt-get install \
      git \
      libcurl4-gnutls-dev \
      libicu-dev \
      libmcrypt-dev \
      libvpx-dev \
      libjpeg-dev \
      libpng-dev \
      libxpm-dev \
      zlib1g-dev \
      libfreetype6-dev \
      libxml2-dev \
      libexpat1-dev \
      libbz2-dev \
      libgmp3-dev \
      libldap2-dev \
      unixodbc-dev \
      libpq-dev \
      libsqlite3-dev \
      libaspell-dev \
      libsnmp-dev \
      libpcre3-dev \
      libtidy-dev \
      rubygems -yqq && \
    gem install dpl

# Compile PHP, include these extensions.
RUN docker-php-ext-install mbstring mcrypt pdo_mysql curl json intl gd xml zip bz2 opcache

# Install Composer
RUN cd /tmp && curl -sS https://getcomposer.org/installer | php && \
    mv /tmp/composer.phar /usr/local/bin/composer
