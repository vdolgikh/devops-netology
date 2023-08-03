resource "yandex_compute_instance" "web" {
  for_each = local.vms
  name = "netology-develop-platform-${each.key}"
  platform_id = var.vm_web_platform_id
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = "5"
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk
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
    user-data          = local.ssh_public_key
  }
  depends_on = [
    yandex_compute_instance.platform
  ]
}
