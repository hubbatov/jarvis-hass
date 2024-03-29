prepare:
	ansible-playbook ansible/playbooks/prepare.yml -v

up:
	docker-compose up -d
 
down:
	docker-compose down

logs:
	docker-compose logs

check-hass:
	docker-compose exec home-assistant /bin/bash -c "hass -c /config --script check_config"

restart-hass:
	docker-compose restart home-assistant

backup:
	./scripts/backup.sh ./scripts/.yandex_token

restore:
	./scripts/restore.sh ./scripts/.yandex_token jarvis_backup_20230617_033001