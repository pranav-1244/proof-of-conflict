resource "null_resource" "apache" {
  provisioner "local-exec" {
    command = "${path.module}/../../script/apache-setup.sh"
  }
}
resource "null_resource" "jenkins" {
  provisioner "local-exec" {
    command = "${path.module}/../../script/jenkins-setup.sh"
  }
}
resource "null_resource" "sonarqube" {
  provisioner "local-exec" {
    command = "${path.module}/../../script/sonarqube-setup.sh"
  }
}
