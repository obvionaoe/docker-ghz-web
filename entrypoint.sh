#!/bin/sh

if [ -z $DB_CONNECTION_GHZ  ]; then
  case $GHZ_DATABASE_TYPE in
    mysql )
      export DB_CONNECTION_GHZ=$GHZ_DB_USER:$GHZ_DB_PASSWORD@/ghz
    ;;
    postgres )
      export DB_CONNECTION_GHZ="host=$GHZ_DB_HOST user=$GHZ_DB_USER dbname=$GHZ_DB_NAME sslmode=$GHZ_DB_SSL_MODE password=$GHZ_DB_PASSWORD"
    ;;
  esac
fi
