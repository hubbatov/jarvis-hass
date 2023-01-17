# Jarvis (home-assistant env)

Pack of services working together with home assistant. 

# Run

Using make utility for running commands:
* up            - running all containers
* down          - stopping all containers
* logs          - watch logs
* check-hass    - check out home assistant
* restart-hass  - restart home assistant
* backup        - make backup to Yandex Disk
* restore       - restore backup from Yandex Disk

# Notes

* For backup/restore working is needed to create file /scripts/.yandex_token [manual for token](https://adc.su/forum/index.php?topic=6304.0)
* Directory /home-assistant/config will be created automacitally if not present. If you have any backup you can restore it on empty directory.