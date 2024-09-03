resource "null_resource" "sonarqube" {
  provisioner "local-exec" {
    command = "${path.module}/../../script/sonarqube-setup.sh"
  }
}
