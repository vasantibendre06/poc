variable "vm_user" {
  description = "The username to connect to the VM"
  type        = string
  default     = "vasanti"
}

variable "vm_ip" {
  description = "The IP address of the VM"
  type        = string
  default     = "192.168.254.133"
}

variable "vm_private_key" {
  description = "The path to the private key file for SSH access"
  type        = string
  default     = "/home/vasanti/.ssh/id_rsa"
}

variable "sonarqube_version" {
  description = "The version of SonarQube to install"
  type        = string
  default     = "9.9.0.65466"
}

