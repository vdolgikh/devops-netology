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

variable "ssh_public_key" {
  type    = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTHpVLnlGtdQ19X3HD6deDtaSgQ2Z4b4Vpg+AwfkmDNohzxU+zvXO1pkIqurueLBOgHj1igoIh/uZsZu9yibUyYrKDwlTxmoLJnCE1w3vmYcFlHyrMMupFmmK+n4U0wwYEt9y5RLy0+udS+wRhXM5vWmIPxJfBnBAFDFcA8xx6ttB0OOsiqhXjHcRSoZbZEOtonioN1f2d0412vQE/666e9sigk1kkBODZGan2cebxutLQQ9BiDWMEg1/6j/LCSb1O9HlaYkPps7n1WtjO5dpgEqkWOEV9qlGEHlOyZf6xihIfgPBteLV2aS96hxasFJ49f6g/9me0eTwxxOgIckPv dolgikh@dolgikh-suse"
}