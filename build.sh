#!/bin/bash

docker build -t reactimage .
result=$( sudo docker images -q reactimage )
if [[ -n "$result" ]]; then
  echo 'Container image exists'
else
  echo 'No such container image'
fi
