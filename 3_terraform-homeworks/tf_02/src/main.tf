resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}

data "yandex_compute_image" "centos" {
  family = var.vm_web_family_centos
}

resource "yandex_compute_instance" "platform" {
  name = local.vm_name_web
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_resources["cpu"]
    memory        = var.vm_web_resources["ram"]
    core_fraction = var.vm_web_resources["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_metadata_centos["serial"]
    ssh-keys           = var.vms_metadata_centos["ssh_root_key"]
  }

}

/*
resource "yandex_compute_instance" "platform" {
  name = local.vm_name_web
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_resources["cpu"]
    memory        = var.vm_web_resources["ram"]
    core_fraction = var.vm_web_resources["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_metadata["serial"]
    ssh-keys           = var.vms_metadata["ssh_root_key"]
  }

}

resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_name_db
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_db_resources["cpu"]
    memory        = var.vm_db_resources["ram"]
    core_fraction = var.vm_db_resources["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.vms_metadata["serial"]
    ssh-keys           = var.vms_metadata["ssh_root_key"]
  }

}
*/