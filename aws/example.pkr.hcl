
source "amazon-ebs" "src" {
  region        =  "us-east-1"
  access_key    =  ""
  secret_key    =  ""
  source_ami    =  ""
  instance_type =  "t2.micro"
  ssh_username  =  "ubuntu"
  ami_name      =  "packer_aws_{{timestamp}}"
}

build {
    sources = ["source.amazon-ebs.src"]

    provisioner "shell" {
        script = "setup.sh"
    }

    post-processor "manifest" {}
}
