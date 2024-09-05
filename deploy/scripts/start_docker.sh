#!/bin/bash
# Login to my AWS ECR
aws ecr get-login-password --region ap-southeast-2 | docker login --username AWS --password-stdin 051826734860.dkr.ecr.ap-southeast-2.amazonaws.com
docker pull 051826734860.dkr.ecr.ap-southeast-2.amazonaws.com/campusx_ecr:v2
docker stop my-container || true
docker rm my-container || true
docker run -d -p 80:5000 -e DAGSHUB_PAT=e691c7193ab61dc9678e31c6b92ded8a65f80697 --name campusx-app 051826734860.dkr.ecr.ap-southeast-2.amazonaws.com/campusx_ecr:v2