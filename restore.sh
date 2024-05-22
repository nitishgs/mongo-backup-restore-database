#!/bin/bash

# Variables
MONGO_HOST="your-mongo-host"
MONGO_PORT="27017"
MONGO_DB="your-database-name"
BACKUP_DIR="/backup"
RESTORE_TIMESTAMP="your-timestamp"  # Set this as needed

# Restore each shard
for shard in $(ls ${BACKUP_DIR} | grep ${RESTORE_TIMESTAMP} | awk -F'-' '{print $1}')
do
    mongorestore --host ${MONGO_HOST}/${shard} --port ${MONGO_PORT} --dir ${BACKUP_DIR}/${shard}-${RESTORE_TIMESTAMP}
done
