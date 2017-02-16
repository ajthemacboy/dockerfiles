#!/bin/bash
path=/root/minecraft-server
cd $path

for i in {25586..25587}
do
	rm .env
	UUID=$(cat /proc/sys/kernel/random/uuid)
	echo "Creating "$UUID"..."
	echo "UUID="$UUID >> .env
	echo "PORT="$i >> .env
	echo "COMPOSE_PROJECT_NAME="$UUID >> .env
	docker-compose up -d --force-recreate
	echo $UUID >> uuidlist.txt
done
