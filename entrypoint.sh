#!/bin/sh

if [ -z $GHZ_DATABASE_CONNECTION  ]; then
  case $GHZ_DATABASE_TYPE in
    mysql )
      export GHZ_DATABASE_CONNECTION=$GHZ_DB_USER:$GHZ_DB_PASSWORD@/ghz
    ;;
    postgres )
      export GHZ_DATABASE_CONNECTION="host=$GHZ_DB_HOST user=$GHZ_DB_USER dbname=$GHZ_DB_NAME sslmode=$GHZ_DB_SSL_MODE password=$GHZ_DB_PASSWORD"
    ;;
  esac
fi
