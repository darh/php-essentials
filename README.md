# PHP essentials

Welcome to [PHP essentials Docker](https://index.docker.io/u/darh/php-essentials/) container.

Main purpuse of this container is to provide
easy to use PHP CLI and other essential
tools for debuging and testing your PHP
applications.





## Contents
 * PHP 5.5.* ([ondrej](https://launchpad.net/~ondrej/+archive/php5)'s repos)
 * [Composer](https://getcomposer.org/)
 * [Pear](http://pear.php.net/)
 * [PHPUnit](http://phpunit.de/) 3.7
 * [PHP Copy/Paste Detector - phpcpd](https://github.com/sebastianbergmann/phpcpd)
 * [PHP Dead Code Detector - phpdcd](https://github.com/sebastianbergmann/phpdcd)
 * [Measuring the size and analyzing the structure of a PHP project - phploc](https://github.com/sebastianbergmann/phploc)
 * [PHP software metrics - pdepend](http://pdepend.org/)
 * [PHP Code sniffer- phpcs](http://pear.php.net/package/PHP_CodeSniffer)
 * [PHP Mess Detector - phpmd](http://phpmd.org/)
 * [Behaviour driven development for PHP - behat](http://behat.org/)


## Get it
```sh
docker pull darh/php-essentials
```

## Run it
Container is give you PHP's interactive mode by default:
```sh
docker run --rm -i -t darh/php-essentials
```
Docker's [run command reference manual](http://docs.docker.io/en/latest/reference/run/)

## See enabled modules, settings:
```sh
docker run --rm -i -t darh/php-essentials php -m
docker run --rm -i -t darh/php-essentials php -i
```

## Run PHP's [internal server](http://www.php.net/manual/en/features.commandline.webserver.php)
(a totally useless example)
```sh
docker run --publish 80:80 --rm -t -i darh/php-essentials \
  php -S 0.0.0.0:80
```


## The tools:
```sh
docker run --rm -i -t darh/php-essentials composer
docker run --rm -i -t darh/php-essentials pear
docker run --rm -i -t darh/php-essentials phpunit
docker run --rm -i -t darh/php-essentials phpcpd
docker run --rm -i -t darh/php-essentials phpdcd
docker run --rm -i -t darh/php-essentials phploc
docker run --rm -i -t darh/php-essentials pdepend
docker run --rm -i -t darh/php-essentials phpcs
docker run --rm -i -t darh/php-essentials phpmd
docker run --rm -i -t darh/php-essentials behat
```
Please note, that running things like `composer autoupdate` is futile as
container & it's content will be removed when command finishes.
If there's a newer version add an issue on Github or rebuild the
php-essentials image yourself.


# Use it
All above example are useless as presented as the code runs in the container
and none of the examples actualy maps local files to the container:

A bit more usefull example -- adding volume param that maps the
current folder and hinting PHP server where it's document root is
```sh
docker run --volume `pwd`:/opt/web/page:r --publish 80:80 --rm -t -i darh/php-essentials \
  php -S 0.0.0.0:80 -t /opt/web/page
```

Do you want to run this long chain every time?

# Solving local/host-remote/container issue with some quick shell scripting
Include essentials.sh file (or it's contents) to bashrc or similar file. This
will enable you to run all these commands as if they were installed on
your local machine

----

# Build it
In case you want to build it yourself
```sh
docker build --rm -t darh/php-essentials .
```

# Bash
```sh
docker run --rm -i -t darh/php-essentials bash
```
