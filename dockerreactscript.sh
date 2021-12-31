#!/bin/bash

sudo apt update && apt upgrade -y
docker stop testing 
docker rm testing
docker rmi dennys9415/jenkinsreact:latest
docker pull dennys9415/jenkinsreact:latest      
docker run -d -p 3000:3000 --name testing dennys9415/jenkinsreact:latest 

##script located in the remote machine