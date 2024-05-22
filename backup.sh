#!/bin/bash

# Variables
MONGO_HOST="your-mongo-host"
MONGO_PORT="27017"
MONGO_DB="your-database-name"
BACKUP_DIR="/backup"
TIMESTAMP=$(date +"\%F-\%H-\%M")

# Create backup directory if not exists
mkdir -p ${BACKUP_DIR}

# Run mongodump for each shard
for shard in $(mongo --quiet --eval "sh.status()" | grep 'shardName' | awk '{print $2}')
do
    mongodump --host ${MONGO_HOST}/${shard} --port ${MONGO_PORT} --out ${BACKUP_DIR}/${shard}-${TIMESTAMP}
done
