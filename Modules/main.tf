resource "null_resource" "apache" {
  provisioner "local-exec" {
    command = "${path.module}/../../scripts/apache-setup.sh"
  }
}
resource "null_resource" "jenkins" {
  provisioner "local-exec" {
    command = "${path.module}/../../scripts/jenkins-setup.sh"
  }
}
resource "null_resource" "sonarqube" {
  provisioner "local-exec" {
    command = "${path.module}/../../scripts/sonarqube-setup.sh"
  }
}
