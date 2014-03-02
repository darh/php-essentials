FROM ubuntu:quantal
MAINTAINER Denis Arh <denis.arh@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# PHP binary & extensions
RUN echo "deb http://ppa.launchpad.net/ondrej/php5/ubuntu quantal main " > /etc/apt/sources.list.d/ondrej.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C
RUN apt-get update
RUN apt-get install -y -q php5-cli=5.5.*
RUN apt-get install -y -q php5-curl php5-xdebug php5-readline php5-sqlite


# Additional tools
ADD https://getcomposer.org/composer.phar             /usr/local/bin/composer
ADD https://phar.phpunit.de/phpunit.phar              /usr/local/bin/phpunit
ADD https://phar.phpunit.de/phpcpd.phar               /usr/local/bin/phpcpd
ADD https://phar.phpunit.de/phpdcd.phar               /usr/local/bin/phpdcd
ADD https://phar.phpunit.de/phploc.phar               /usr/local/bin/phploc
ADD http://static.pdepend.org/php/latest/pdepend.phar /usr/local/bin/pdepend

# Make the tools executable
RUN cd /usr/local/bin && \
  chmod +x composer phpunit phpcpd pdepend phpdcd phploc


# Custom configuration
ADD essentials.ini /etc/php5/cli/conf.d/99-essentials.ini


CMD ["/usr/bin/php" "-a"]