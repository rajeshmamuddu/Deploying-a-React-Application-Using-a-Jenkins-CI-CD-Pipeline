#!/bin/bash
result=$( sudo docker images -q reactimage )
docker run -itd --name My-first-container2 -p 8000:5000 $result
CONTAINER_NAME='My-first-container2'
x=$(docker ps -q -f status=running -f name=$CONTAINER_NAME)
if [[ -n "$x" ]]; then
  echo 'Container exists'
else
  echo 'No container image'
fi
