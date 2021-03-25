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
        echo "Some $OSTYPE distributions could install Docker, we will try to install Docker for you..." 
        ./scripts/installDockerForUbuntu.sh   
        echo "Installation complete, setting up the sudo su command, you will need the root access to this linux machine."
        sudo su ;;
      *)        echo "Sorry, this $OSTYPE might not have Docker implementation" ;;
    esac
fi


# If docker is running already, first run a data dump before shutting down docker processes
# One can use the following instruction to find the current directory name withou the full path
# CURRENTDIR=${PWD##*/}
LOWERCASE_CURRENTDIR="$(tr [A-Z] [a-z] <<< "${PWD##*/}")"
MW_CONTAINER=$LOWERCASE_CURRENTDIR"_mediawiki_1"
BACKUPSCRIPTFULLPATH="/var/www/html/images/backupAllContentData.sh"
RESOTRESCRIPTFULLPATH="/var/www/html/images/restoreAllContentData.sh"

echo "Executing: " docker exec $MW_CONTAINER $BACKUPSCRIPTFULLPATH
docker exec $MW_CONTAINER $BACKUPSCRIPTFULLPATH
# stop all docker processes
docker-compose down --volumes

# If the mountPoint directory doesn't exist, 
# Decompress the InitialDataPackage to ./mountPoint 
if [ ! -e ./mountPoint/ ]; then
tar -xzvf ./InitialDataPackage.tar.gz -C .
fi

# Start the docker processes
docker-compose up -d
# After docker processes are ready, reload the data from earlier dump
echo "Loading data from earlier backups..."
docker exec $MW_CONTAINER $RESOTRESCRIPTFULLPATH


