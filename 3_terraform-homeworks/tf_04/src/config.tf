data template_file "cloud-init" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    ssh_public_key = file("/home/val/.ssh/id_rsa.pub")
  }
}