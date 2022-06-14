# Docker :whale: Packer :package: and Ansible :robot:

## How to use


```
docker build -t docker-packer-ansible .
```

- to build the docker image


```
docker run -it docker-packer-ansible
```

- to run docker container in interactive mode


---


# Optional (Packer) 

## How to use


```
packer build -var-file=variables.pkrvars.hcl example.pkr.hcl
```

- to build and deploy the AMI OR Azure image


```
packer build -only=foo,bar example.json
```

- useful if you have multiple builders in one file to run only the specified builders. the -only flag doesnt affect provisioners. e.g: azure-arm or amazon-ebs


---


# Optional (Ansible) 

## How to use

cd into ansible directory

```
ansible-playbook -i inventory --private-key=key.pem main-2.yml -u azureuser
```

- run the main ansible playbook on the inventory using the ssh key and log in as the specified user.


---


## Docs

Docker: https://docs.docker.com/get-started/

Packer: https://www.packer.io/docs

Ansible: https://docs.ansible.com/ansible/latest/user_guide/index.html#getting-started

