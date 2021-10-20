#!/bin/bash

#Docker Compose execution
docker-compose down
docker-compose rm
docker-compose pull
docker-compose build --no-cache
docker-compose up -d --force-recreate --renew-anon-volumes

#MongoDB Admin user creation
docker exec db_mongodb_hagfire_test mongo admin ./setup/mongodb-setup-admin.js

#MongoDB Hangfire user creation
docker exec db_mongodb_hagfire_test mongo Hangfire ./setup/mongodb-setup-hangfire.js -u admin -p root123 --authenticationDatabase admin