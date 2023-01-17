#!/bin/bash

# Need to set backup name - latest backup. Now it will be fetched from arg2
BACKUP_NAME=$2
ENDPOINT="https://webdav.yandex.ru/"
TOKEN=$(<$1)

echo "Waiting..."

curl --progress-bar --verbose --header "Authorization: OAuth $TOKEN" -o $BACKUP_NAME.tar.gz https://webdav.yandex.ru/$BACKUP_NAME.tar.gz
sudo tar xzf $BACKUP_NAME.tar.gz --strip 1

rm ./$BACKUP_NAME.tar.gz

echo "Done"