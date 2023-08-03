###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "platform_number" {
  default = {
    "0" = "1"
    "1" = "2"
  }
  description = "For instance count start at 1"
}

variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image family"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "VM instance platform id"
}

variable "vm_web_resources" {
  type        = map
  default     = {
    cpu           = 2
    ram           = 1
    core_fraction = 5
  }
  description = "VMs resources"
}

variable "vms_metadata" {
  type        = map
  default     = {
    serial       = 1
    ssh_root_key = "ubuntu:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAsq2ExfK3566dlMj6YsJ+wv7JJdMSN4C6w1aChS2qJH dolgikh@dolgikh"
  }
}

variable "main_replica_properties" {
  type        = list(object({ 
    vm_name     = string
    cpu         = number
    ram         = number
    disk        = number
  }))
  default    = [
    {
     vm_name    = "main"
     cpu        = 2
     ram        = 1
     disk       = 5
    }
  ]
}

variable "vlms" {
  description = "Secondary disks"
  type = list(object(
    {
      disk_id     = number
  }))
  default = [
    { 
      disk_id      = "0"
    },
    { 
      disk_id      = "1"
    },
    { 
      disk_id      = "2"
    },
  ]
}

variable "public_key" {
  type    = string
  default = ""
}