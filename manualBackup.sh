#! /bin/bash

LOWERCASE_CURRENTDIR="$(tr [A-Z] [a-z] <<< "${PWD##*/}")"

BACKUPANDRESTORE_DIR="/var/www/html/extensions/BackupAndRestore"

docker exec -i -t $LOWERCASE_CURRENTDIR"_mediawiki_1" $BACKUPANDRESTORE_DIR/backupRegularly.sh