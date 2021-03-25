#! /bin/bash

# Check if docker is installed or not
if [[ $(which docker) && $(docker --version) ]]; then
  echo "$OSTYPE has $(docker --version) installed"
  else
    echo "You need to Install docker"
    # command
    case "$OSTYPE" in
      darwin*)  echo "$OSTYPE should install Docker Desktop by following this link https://docs.docker.com/docker-for-mac/install/" ;; 
      msys*)    echo "$OSTYPE should install Docker Desktop by following this link https://docs.docker.com/docker-for-windows/install/" ;;
      cygwin*)  echo "$OSTYPE should install Docker Desktop by following this link https://docs.docker.com/docker-for-windows/install/" ;;
      linux*)
        ./scripts/installDockerForUbuntu.sh   
        echo "$OSTYPE will run the following installation script" ;;
      *)        echo "Sorry, this $OSTYPE might not have Docker implementation" ;;
    esac
fi


# If docker is running already, stop all docker processes
docker-compose down --volumes

# If the mountPoint directory doesn't exist, 
# Decompress the InitialDataPackage to ./mountPoint 
if [ ! -e ./mountPoint/ ]; then
tar -xzvf ./InitialDataPackage.tar.gz -C .
fi

# Start the docker processes
docker-compose up -d


