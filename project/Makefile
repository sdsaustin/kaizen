CUSTOMER_BINARY=customerService

## up: starts all containers in the background without forcing build
docker_up:
	@echo "Starting Docker images..."
	docker-compose up -d
	@echo "Docker images started!"

## up_build: stops docker-compose (if running), builds all projects and starts docker compose
up_build: build_customer
	@echo "Stopping docker images (if running...)"
	docker-compose down
	@echo "Building (when required) and starting docker images..."
	docker-compose up --build -d
	@echo "Docker images built and started!"

## down: stop docker compose
stop_docker:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"

## build_broker: builds the broker binary as a linux executable
build_customer:
	@echo "Building customer binary..."
	cd ../customer && env GOOS=linux CGO_ENABLED=0 go build -o ${CUSTOMER_BINARY} ./cmd/api
	@echo "Done!"

## Start postgres
start_postgres:
	@echo "starting postgres server"
	docker run --name postgres-15 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_DB=kaizen -e POSTGRES_PASSWORD=mysecret -d postgres:15.2-alpine 
	@echo "postgres server started"

## Stop postgres
stop_postgres:
	@echo "Stopping postgres"
	docker stop postgres-15
	docker rm postgres-15
	@echo "postgres Stopped"

## DB MIgration
db_migrate_up:
	@echo "migrating database"
	migrate -path ../customer/db/migrations -database "postgresql://root:mysecret@localhost:5432/kaizen?sslmode=disable" -verbose up
	@echo "migration Done"

##DB Migration
db_migrate_down:
	@echo "migrating database"
	migrate -path ../customer/db/migrations -database "postgresql://root:mysecret@localhost:5432/kaizen?sslmode=disable" -verbose down
	@echo "migration Done"

.PHONY:  db_migrate_down db_migrate_up stop_postgres start_postgres build_customer stop_docker up_build docker_up