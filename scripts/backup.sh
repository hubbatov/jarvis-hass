#!/bin/bash

set -e

ENDPOINT="https://webdav.yandex.ru/"
BACKUP_NAME=jarvis_backup_$(date +"%Y%m%d_%H%M%S")
TOKEN=$(<$1)

echo "Waiting..."

mkdir -p $BACKUP_NAME/{home-assistant/config,mqtt}

sudo cp -r home-assistant/config/ $BACKUP_NAME/home-assistant/config/
sudo cp -r mqtt/ $BACKUP_NAME/mqtt/

sudo tar czf $BACKUP_NAME.tar.gz $BACKUP_NAME

sudo rm -rf ./$BACKUP_NAME
curl --progress-bar -o /dev/stdout --verbose --header "Authorization: OAuth $TOKEN" -T $BACKUP_NAME.tar.gz $ENDPOINT/$BACKUP_NAME.tar.gz
sudo rm ./$BACKUP_NAME.tar.gz

echo "Done"