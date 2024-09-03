resource "null_resource" "jenkins" {
  provisioner "local-exec" {
    command = "${path.module}/../../script/jenkins-setup.sh"
  }
}
