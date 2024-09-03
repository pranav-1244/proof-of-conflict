provider "null" {}

module "apache" {
  source = "./modules/apache"
}

module "jenkins" {
  source = "./modules/jenkins"
}

module "sonarqube" {
  source = "./modules/sonarqube"
}

