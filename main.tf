provider "null" {}

module "apache" {
  source = "./Modules/apache"
}

module "jenkins" {
  source = "./Modules/jenkins"
}

module "sonarqube" {
  source = "./Modules/sonarqube"
}

