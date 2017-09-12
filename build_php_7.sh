#!/bin/sh

PHP_VERSION_GIT_BRANCH=PHP-7.1.1

echo "Build PHP Binary from current branch '$PHP_VERSION_GIT_BRANCH' on https://github.com/php/php-src"

docker build --build-arg PHP_VERSION=$PHP_VERSION_GIT_BRANCH -t php-build -f Dockerfile.BuildPHP .

container=$(docker create php-build)

docker -D cp $container:/root/php7/usr/bin/php ./php

docker rm $container
