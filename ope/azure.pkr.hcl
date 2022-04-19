
variable "client_id" {
  type = string
  default = ""
  sensitive = true
}

variable "client_secret" {
  type = string
  default = ""
  sensitive = true
}

variable "subscription_id" {
  type = string
  default = ""
  sensitive = true
}

variable "image_name" {
  type = string
  default = ""
}

variable "rg_name" {
  type = string
  default = ""
}

variable "manifest" {
  type = string
  default = ""
}

source "azure-arm" "example" {
  client_id         = "${var.client_id}"
  client_secret     = "${var.client_secret}"
  subscription_id   = "${var.subscription_id}"

  os_type           = "Linux"
  image_publisher   = "Canonical"
  image_offer       = "UbuntuServer"
  image_sku         = "18.04-LTS"

  location          = "East US"
  vm_size           = "Standard_DS1_v2"

  managed_image_name = "${var.image_name}_{{ timestamp }}"
  managed_image_resource_group_name = "${var.rg_name}"
}

build {
    sources = ["source.azure-arm.example"]

    provisioner "ansible" {
        playbook_file = "ansible/main.yml"
        roles_path    = "ansible/roles/"
        user = "${var.ansible_user}"
    }

    post-processor "manifest" {
        output = "${var.manifest}"
    }
}
