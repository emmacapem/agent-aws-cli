FROM jenkins/agent:latest-jdk21

USER root

RUN apt-get update
RUN apt-get install -y apt-transport-https 
RUN apt-get install -y ca-certificates
RUN apt-get install -y curl
RUN apt-get install -y gnupg-agent
RUN apt-get install -y gnupg
RUN apt-get install -y software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get install -y docker-ce-cli
RUN apt-get install -y unzip
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN apt-get install -y git

RUN groupadd -g 992 docker && \
    usermod -a -G docker jenkins

USER jenkins

RUN touch v1.0.0.txt