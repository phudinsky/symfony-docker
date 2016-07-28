#!/usr/bin/env bash

# Disable xdebug in production environment
xdebug_config=/usr/local/etc/php/conf.d/xdebug.ini
if [ -f $xdebug_config ] && [ "$SYMFONY_ENV" == "prod" ]; then
    rm $xdebug_config
fi

./bin/healthcheck 10

php-fpm --allow-to-run-as-root