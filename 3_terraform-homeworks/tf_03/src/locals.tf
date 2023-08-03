locals {
  vms = {
    "main"    = { cpu = "2", ram = "1", disk = "6" },
    "replica" = { cpu = "2", ram = "2", disk = "5" }
  }
  ssh_public_key = "${file("~/.ssh/id_rsa.pub")}"
}
