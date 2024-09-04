terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }
}


module "jenkins" {
  source = "./terraform-modules/jenkins-module"

  # Pass variables to the module
  vm_user         = var.vm_user
  vm_ip           = var.vm_ip
  vm_private_key  = var.vm_private_key
}

module "sonarqube" {
  source = "./terraform-modules/sonarqube-module"

  # Pass variables to the module
  vm_user         = var.vm_user
  vm_ip           = var.vm_ip
  vm_private_key  = var.vm_private_key
}

