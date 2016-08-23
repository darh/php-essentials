FROM ubuntu:14.04.1
MAINTAINER Denis Arh <denis.arh@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# PHP binary & extensions
RUN apt-get update
RUN apt-get install -y -q php5-cli=5.5.*
RUN apt-get install -y -q php5-curl php5-xdebug php5-readline php5-sqlite
RUN apt-get install -y -q php-pear


# Additional tools
ADD https://getcomposer.org/composer.phar /usr/local/bin/composer
ADD https://phar.phpunit.de/phpunit.phar  /usr/local/bin/phpunit
ADD https://phar.phpunit.de/phpcpd.phar   /usr/local/bin/phpcpd
ADD https://phar.phpunit.de/phpdcd.phar   /usr/local/bin/phpdcd
ADD https://phar.phpunit.de/phploc.phar   /usr/local/bin/phploc

# Make the tools executable
RUN cd /usr/local/bin && \
  chmod +x composer phpunit phpcpd phpdcd phploc

RUN /usr/local/bin/composer global require \
	'squizlabs/php_codesniffer=1.5.*' \
	'pdepend/pdepend=1.1.*' \
	'phpmd/phpmd=1.4.*' \
	'behat/behat=2.4.*@stable'

# Add path to composed tools
ENV PATH /root/.composer/vendor/bin:$PATH

# Custom configuration
ADD essentials.ini /etc/php5/cli/conf.d/99-essentials.ini


CMD ["/usr/bin/php" , "-a"]
