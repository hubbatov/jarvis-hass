#!/bin/bash

set -e

read -p "Enter login: " LOGIN
read -s -p "Enter password: " PASSWORD

ENDPOINT="https://webdav.yandex.ru/dump"
BACKUP_NAME=jarvis_backup_$(date +"%Y%m%d_%H%M%S")

echo "Waiting..."

mkdir -p $BACKUP_NAME/{home-assistant/config,zigbee2mqtt/data,certbot,mqtt}

sudo cp home-assistant/config/secrets.yaml $BACKUP_NAME/home-assistant/config/secrets.yaml
sudo cp home-assistant/config/html5_push_registrations.conf $BACKUP_NAME/home-assistant/config/html5_push_registrations.conf
sudo cp home-assistant/config/known_devices.yaml $BACKUP_NAME/home-assistant/config/known_devices.yaml
sudo cp -r home-assistant/config/.storage/ $BACKUP_NAME/home-assistant/config/.storage/

sudo cp -r mqtt/ssl/ $BACKUP_NAME/mqtt/ssl/

sudo tar czf $BACKUP_NAME.tar.gz $BACKUP_NAME

sudo rm -rf ./$BACKUP_NAME
curl --progress-bar -o /dev/stdout --verbose -T $BACKUP_NAME.tar.gz --user $LOGIN:$PASSWORD $ENDPOINT/$BACKUP_NAME.tar.gz
sudo rm ./$BACKUP_NAME.tar.gz

echo "Done"