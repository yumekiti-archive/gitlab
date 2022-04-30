dc := docker compose -f ./docker-compose.yml

.PHONY: up
up:
	$(dc) up -d --build

.PHONY: down
down:
	$(dc) down

.PHONY: restart
restart:
	$(dc) restart

.PHONY: reup
reup:
	@make down
	@make up

.PHONY: rm
rm:
	$(dc) down --rmi all

.PHONY: logs
logs:
	$(dc) logs -f

.PHONY: gitlab
gitlab:
	$(dc) exec gitlab /bin/sh

.PHONY: console
console:
	$(dc) exec gitlab gitlab-rails console -e production