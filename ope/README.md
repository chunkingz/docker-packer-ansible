# Packer 


## How to use

packer build example.json
OR
packer build example.pkr.hcl

- to build and deploy the AMI or azure image


## build with variable files

packer build -var-file=variables.json example.json
OR
packer build -var-file=variables.pkrvars.hcl example.pkr.hcl

- run the build with variables stored in the variables.pkrvars.hcl file
https://www.packer.io/guides/hcl/variables


## validate with var file

packer validate -var-file=variables.pkrvars.hcl example.pkr.hcl

- try to validate the packer configuration with the variables stored in the variables.pkrvars.hcl file


---


## extras

grep artifact_id manifest.json | cut -d "/" -f9

- in shell run the script above to get the image name from the manifest.json file


export PKR_VAR_weekday=Monday

- set env vars in terminal => https://www.packer.io/guides/hcl/variables#from-environment-variables


---


## Docker

docker build -t docker-packer-ansible .

- to build the docker image


docker run -it docker-packer-ansible

- to run docker container in interactive mode

