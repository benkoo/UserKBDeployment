#! /bin/bash

# First, stop all docker processes
docker-compose down --volumes

# If the mountPoint directory doesn't exist, 
# Decompress the InitialDataPackage to ./mountPoint 
if [ ! -e ./mountPoint/ ]; then
tar -xzvf ./InitialDataPackage.tar.gz -C .
fi

# Start the docker processes
docker-compose up -d


