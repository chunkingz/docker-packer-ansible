FROM ubuntu:20.04

WORKDIR /packer_ansible

COPY . .

# Update OS, install python3 and ansible.
RUN apt update && apt upgrade -y && apt install python3-pip -y && pip3 install ansible && apt install ansible -y;

# Install Packer
RUN apt install curl -y && curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && DEBIAN_FRONTEND=noninteractive apt install -y tzdata; \
    apt install software-properties-common -y && apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"; \
    apt update && apt install packer -y;


RUN packer build -var-file=variables.pkrvars.hcl example.pkr.hcl

