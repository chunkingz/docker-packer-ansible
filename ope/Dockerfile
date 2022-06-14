FROM ubuntu:20.04

WORKDIR /packer_ansible

COPY . .

# Update OS, install python3 and ansible.
RUN apt update && apt upgrade -y && DEBIAN_FRONTEND=noninteractive apt install -y tzdata; \
    apt install software-properties-common -y; \ 
    apt-add-repository --yes --update ppa:ansible/ansible-2.9 && apt install -y ansible;

# Install Packer
RUN apt install curl -y && curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -; \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"; \
    apt install packer=1.8.0 -y;


RUN packer build -var-file=azure_vars.pkrvars.hcl azure.pkr.hcl; \ 
    export AMI=`grep artifact_id manifest.json | cut -d "/" -f9 | cut -d '"' -f1 | tail -1`; \
    echo $AMI;
    # grep artifact_id manifest.json | cut -d "/" -f9 | cut -d '"' -f1 | tail -1;

# RUN ansible-playbook ansible/az_vm_custom_ami.yml -e "custom_image=$AMI"
# OR
# RUN ansible-playbook ansible/aws_ec2_custom_ami.yml -e "custom_image=$AMI"
