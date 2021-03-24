#! /bin/bash

# First, stop all docker processes
docker-compose down --volumes

# Decompress the InitialDataPackage to ./mountPoint 
tar -xzvf ./InitialDataPackage.tar.gz -C .

# Start the docker processes
docker-compose up -d


