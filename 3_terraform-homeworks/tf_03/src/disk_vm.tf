resource "yandex_compute_disk" "ext_disk" {
  count    = 3
  name     = "ext-disk-${count.index}"
  type     = "network-ssd"
  zone     = "ru-central1-a"
  size     = 1
}

resource "yandex_compute_instance" "storage" {
  for_each = local.vm_storage
  name       = "netology-develop-platform-${each.key}"
  depends_on = [
    yandex_compute_disk.ext_disk
  ]
  platform_id = var.vm_web_platform_id
  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size = each.value.disk
    }
  }
  dynamic "secondary_disk" {
    for_each = var.vlms
    content {
        disk_id       = "${yandex_compute_disk.ext_disk[secondary_disk.key].id}"
        auto_delete = true
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
