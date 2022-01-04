#!/bin/bash

. ../vars.sh

# WordPress 構築
kusanagi provision --wp --wplang ja --fqdn ${WP_FQDN} --noemail --dbname ${WP_DB_NAME} --dbuser ${WP_DB_USER} --dbpass ${WP_DB_PASS} ${WP_PROFILE}
