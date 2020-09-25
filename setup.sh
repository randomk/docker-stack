#!/bin/sh
# Creat by Abraão Silva
# Simply execute this script to setup docker-tools-stack:
#

# Prerequisites:
# - Docker & docker-compose 
# - Git v2.x

echo "Startup Docker Compose"
# - Step 1 (Up Nexus 3)
docker-compose -f nexus3-compose.yml up -d

# - Step 2 (Up Jfrog Artifactory)
docker-compose -f artifactory-oss.yml up -d

# - Step 3 (Jenkins and Sonarqube)
docker-compose up -d

### Warning ###
# if the Jenkins of the following permission error
# - /var/jenkins_home/copy_reference_file.log’: Permission denied 
# - Execute: chown -R 1000:1000 jenkins-stack-tools/

## Quick Start Stack ELK
# - On application host go to `beats` directory and start Filebeat with Docker Compose:

cd beats
docker-compose up -d && cd ../
 
# - On the ELK host go to `elk` directory and start ELK stack with Docker compose:

cd elk
docker-compose up -d


## Remove All Images

#docker rm -f $(docker ps -a -q)
