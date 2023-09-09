terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=0.13"

  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "tfstate-vdolgikh"
    region   = "ru-central1-a"
    key      = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
  

}

provider "yandex" {
  token     = var.token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.default_zone
}

module "vpc_network" {
  source         = "./.terraform/modules/vpc_network"
  env_name       = "develop"
  zone           = "ru-central1-a"
  v4_cidr_blocks = "10.0.1.0/24"
}

module "test-vm" {
  source          = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name        = "develop"
  network_id      = module.vpc_network.vpc_network_id
  subnet_zones    = ["ru-central1-a"]
  subnet_ids      = module.vpc_network.vpc_subnet[*]
  instance_name   = "web"
  instance_count  = 2
  image_family    = "ubuntu-2004-lts"
  public_ip       = true
  
  metadata = {
      user-data          = data.template_file.cloud-init.rendered 
      serial-port-enable = 1
  }

}
