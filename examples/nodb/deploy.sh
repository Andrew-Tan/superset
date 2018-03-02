#!/bin/bash

set -e

# Start back end
echo "Starting redis service..."
docker-compose up -d redis

# Start Superset
echo "Starting Superset..."
docker-compose up -d superset

# Inititalize
docker-compose exec superset superset-nodb-init

echo "Navigate to http://localhost:8088 to view"
echo -n "Press RETURN to bring down demo"
read down
docker-compose down
