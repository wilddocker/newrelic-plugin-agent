#!/bin/bash

set -e

echo "Replacing NEWRELIC_KEY with '$NEWRELIC_KEY'"
sed -i "s/REPLACE_WITH_REAL_KEY/$NEWRELIC_KEY/g" /newrelic-plugin-agent.cfg

echo $@

if [ "$1" = 'newrelic-plugin-agent' ]; then
    exec "$@"
fi

exec "$@"
