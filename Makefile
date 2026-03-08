ifneq ("$(wildcard .env.local)","")
	include .env.local
	export
else ifneq ("$(wildcard .env)","")
	include .env
	export
endif

PROJECT_NAME ?= mysql-template
SQL_PASSWORD ?= password123
SQL_PORT     ?= 3306

.PHONY: up down status logs clean shell

up:
	@echo "Starting $(PROJECT_NAME) on port $(SQL_PORT)"
	PROJECT_NAME="$(PROJECT_NAME)" \
	SQL_PASSWORD="$(SQL_PASSWORD)" \
	SQL_PORT="$(SQL_PORT)" \
	docker-compose up -d --remove-orphans

down:
	@PROJECT_NAME="$(PROJECT_NAME)" \
	docker-compose down --remove-orphans

# Connect to MySQL without specifying a database
shell:
	@docker exec -it $(PROJECT_NAME) mysql -u root -p$(SQL_PASSWORD)

status:
	@docker ps --filter "name=$(PROJECT_NAME)"

logs:
	@docker logs -f $(PROJECT_NAME)

clean:
	@echo "Warning: Deleting all data for $(PROJECT_NAME)"
	@PROJECT_NAME="$(PROJECT_NAME)" \
	docker-compose down -v --remove-orphans