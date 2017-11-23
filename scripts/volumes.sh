#!/bin/bash

docker volume create -d local-persist -o mountpoint=~/portal/data/filestorage -o command="chown -R 500:500 /data" --name=data-filestorage
docker volume create -d local-persist -o mountpoint=~/portal/data/blobstorage -o command="chown -R 500:500 /data" --name=data-blobstorage
docker volume create -d local-persist -o mountpoint=~/portal/data/backups -o command="chown -R 500:500 /data" --name=data-backups
docker volume create -d local-persist -o mountpoint=~/portal/data/blobstoragebackups -o command="chown -R 500:500 /data" --name=data-blobstoragebackups
