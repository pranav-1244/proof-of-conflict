resource "null_resource" "apache" {
  provisioner "local-exec" {
    command = "${path.module}/../../script/apache-setup.sh"
  }
}
