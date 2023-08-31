variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image family"
}

variable "vm_web_family_centos" {
  type        = string
  default     = "centos-7"
  description = "VM image family"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM instance name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM instance platform id"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "VM instance name"
}

variable "vm_web_resources" {
  type = map
  default = {
    cpu = 2
    ram = 1
    core_fraction = 5
  }
}

variable "vm_db_resources" {
  type = map
  default = {
    cpu = 2
    ram = 2
    core_fraction = 20
  }
}
