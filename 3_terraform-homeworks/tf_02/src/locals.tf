locals {
  vm_name_web = "${var.vm_properties["company"]}-${var.vm_properties["env"]}-${var.vm_properties["web"]}"
  vm_name_db  = "${var.vm_properties["company"]}-${var.vm_properties["env"]}-${var.vm_properties["db"]}"
}
