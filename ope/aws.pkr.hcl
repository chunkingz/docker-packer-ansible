
variable "access_key" {
  type = string
  default = ""
  sensitive = true
}

variable "secret_key" {
  type = string
  default = ""
  sensitive = true
}

variable "source_ami" {
  type = string
  default = ""
  sensitive = true
}

variable "ssh_username" {
  type = string
  default = ""
  sensitive = true
}

variable "region" {
  type = string
  default = ""
}

variable "instance_type" {
  type = string
  default = ""
}

variable "ami_name" {
  type = string
  default = ""
}

variable "manifest" {
  type = string
  default = ""
}


source "amazon-ebs" "src" {
  access_key         = "${var.access_key}"
  secret_key     = "${var.secret_key}"
  source_ami   = "${var.source_ami}"
  ssh_username   = "${var.ssh_username}"
  region   = "${var.region}"
  instance_type   = "${var.instance_type}"
  ami_name   = "${var.ami_name}"
}

build {
    sources = ["source.amazon-ebs.src"]

    provisioner "ansible" {
        playbook_file = "ansible/main.yml"
        roles_path    = "ansible/roles/"
        user = "${var.ansible_user}"
    }

    post-processor "manifest" {
        output = "${var.manifest}"
    }
}
