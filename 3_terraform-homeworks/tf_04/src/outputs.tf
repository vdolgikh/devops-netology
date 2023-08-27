output cloud-init {
  value = "\n${data.template_file.cloud-init.rendered}"
}