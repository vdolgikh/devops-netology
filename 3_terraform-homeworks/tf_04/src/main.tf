terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"
}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

module "vpc_dev" {
  source        = "./.terraform/modules/vpc"
  env_name      = "develop"
  subnet_ids    = [ yandex_vpc_subnet.develop.id ]
  network_id    = yandex_vpc_network.develop.id
  subnet_zones  = ["ru-central1-a"]
  metadata = {
  }

}

/*
module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = "develop"
  network_id      = yandex_vpc_network.develop.id
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = [ yandex_vpc_subnet.develop.id ]
  instance_name   = "web"
  instance_count  = 2
  image_family    = "ubuntu-2004-lts"
  public_ip       = true
  
  metadata = {
      user-data          = data.template_file.cloud-init.rendered #Для демонстрации №3
      serial-port-enable = 1
  }

}
*/
#Пример передачи cloud-config в ВМ для демонстрации №3
#data "template_file" "cloudinit" {
# template = file("./cloud-init.yml")
#}

