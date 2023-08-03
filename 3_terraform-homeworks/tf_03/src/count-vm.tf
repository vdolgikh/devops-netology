data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family
}
resource "yandex_compute_instance" "web" {
  count = 2
  name = "netology-develop-platform-web-${lookup(var.platform_number, count.index)}"
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
    security_group_ids = [yandex_vpc_security_group.example.id]
  }
  metadata = {
    serial-port-enable = var.vms_metadata["serial"]
    ssh-keys           = var.vms_metadata["ssh_root_key"]
  }
  depends_on = [
    yandex_vpc_security_group.example 
  ]
}
