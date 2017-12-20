#!/bin/bash
docker volume create -d local-persist -o mountpoint=~/portal/data -o command="chown -R 500:500 /data" --name=data
