#!/bin/sh

repository="public.ecr.aws/v2t3u7q0/agent-aws-cli"
image_tag="latest"

docker tag agent-aws-cli:$image_tag $repository:$image_tag

aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws

docker push $repository:$image_tag
