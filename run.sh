#!/bin/bash
set +x

#Colours
RED='\033[0;31m'
NC='\033[0m' # No Color
Blue='\033[0;34m'


#Functions 

Confirmation(){
    read -p " Do you wish to continue? " yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
}


############################Get the user confiramtion##################################
clear
echo -e "\n\n###################################################################################################################"
echo  -e " \n

This script will do the following: \n

-Build the Java application using maven  \n
-Build the docker file for the dropwizard application \n
-Run the docker-compose file that is configured to start both the containerized app and Nginx as a reverse proxy
-Please note Nginx will be using port 80 on the host machine, the application dropwizard will not be published to the host machine \n"

Confirmation


#Checking if port 22 status if it is being used will exit
echo > /dev/tcp/localhost/80 2>&1 > /dev/null
if [ $? -eq 0 ]; then   
      echo -e " ${RED}  \n  This port is alredy use!  ${NC}" && exit
fi

#if not will continue 
clear
echo "80 Port is open, proceeding ....."

#Maven & Docker build for dropwizard-service
cd dropwizard
mvn package
docker build -t dropwizard-service-1 .
cd -

#start the docker compose file in the background
docker-compose up -d

#a qucik test using curl 
echo -e "${Blue}\n A quick test using curl \n  ${NC}"
sleep 2
curl -i http://127.0.0.1:80/hello && echo  -e " \n\n"


