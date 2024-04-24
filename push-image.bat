@echo off
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 184739442090.dkr.ecr.us-west-2.amazonaws.com
docker tag agent-aws-cli public.ecr.aws/v2t3u7q0/agent-aws-cli
docker push public.ecr.aws/v2t3u7q0/agent-aws-clipu 