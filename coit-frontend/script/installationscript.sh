#!/bin/bash

sudo apt-get update
sudo apt-get install nodejs npm -y

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install


aws s3 cp s3://codebuild-practice-danjim238/build/* /home/ubuntu/build/ --recursive
ls -l
pwd
