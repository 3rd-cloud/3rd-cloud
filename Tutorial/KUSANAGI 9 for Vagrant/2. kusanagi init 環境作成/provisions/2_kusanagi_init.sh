#!/bin/bash

source /vagrant/vars.sh

# KUSANAGI 9 初期設定
kusanagi init --tz Asia/Tokyo --lang ja --keyboard ja --passwd ${KUSANAGI_PASS} --nophrase --dbrootpass ${DB_ROOT_PASS} --nginx121 --php80 --mariadb10.5 --ruby26

dnf update -y
