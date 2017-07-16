FROM php:7.0-apache

MAINTAINER Nutchawat Ploywattanawong (pnutchaw@gmail.com)

RUN apt-get update \
        && apt-get -y upgrade \
        && apt-get install -y \
                git \
                libaio1 \
                libjpeg62-turbo-dev \
                libfreetype6-dev \
                libmcrypt-dev \
                libpng12-dev \
                unzip \
                vim \
                zlib1g-dev \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure \
                gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
        && docker-php-ext-install \
                mysqli \
                gd \
                mcrypt \
                zip

RUN docker-php-ext-enable \
                opcache

RUN groupmod -g 500 www-data \
        && usermod -u 500 www-data

COPY ess.conf /etc/apache2/conf-available/ess.conf
RUN echo "Asia/Bangkok" | tee /etc/timezone \
        && dpkg-reconfigure -f noninteractive tzdata \
        && echo "date.timezone = Asia/Bangkok" | tee /usr/local/etc/php/conf.d/locale.ini \
        && echo 'default_charset = "utf-8"' | tee -a /usr/local/etc/php/conf.d/locale.ini \
        && echo "cgi.fix_pathinfo = 0" | tee -a /usr/local/etc/php/conf.d/file.ini \
        && echo "upload_max_filesize = 8M" | tee -a /usr/local/etc/php/conf.d/file.ini \
        && a2enconf \
                ess \
        && a2enmod \
                expires \
                headers \
                # http2 \ # wait until apache 2.4.17
                include \
                rewrite \
                setenvif \
                ssl \
        && rm /etc/apache2/conf-enabled/charset.conf \
        && rm /etc/apache2/conf-enabled/localized-error-pages.conf \
        && rm /etc/apache2/conf-enabled/security.conf \
        && rm /etc/apache2/mods-enabled/deflate.conf \
        && sed -i "s/SSLCipherSuite/#SSLCipherSuite/g" /etc/apache2/mods-available/ssl.conf \
        && sed -i "s/SSLProtocol/#SSLProtocol/g" /etc/apache2/mods-available/ssl.conf

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
