#! /bin/bash

docker-compose down --volumes
docker rmi -f $(docker images -q)
