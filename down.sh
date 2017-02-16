#!/bin/bash
path=/root/minecraft-server
cd $path

while read UUID; do
	rm -rf /dock/minecraft/$UUID
	grep -v $UUID uuidlist.txt > uuidlist.txt.tmp
	mv uuidlist.txt.tmp uuidlist.txt
done <uuidlist.txt

docker kill $(docker ps -a -f name=minecraft_ -q)
docker rm $(docker ps -a -f name=minecraft_ -q)
