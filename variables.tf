# Define the SSH user for the VM
variable "vm_user" {
  description = "The SSH user to connect to the VM"
  type        = string
}

# Define the IP address of the VM
variable "vm_ip" {
  description = "The IP address of the VM"
  type        = string
}

# Define the private key path for SSH connection
variable "vm_private_key" {
  description = "The path to the private key file for SSH access"
  type        = string
}

# Optional: Define any additional variables for Jenkins
variable "jenkins_port" {
  description = "The port where Jenkins will be accessible"
  type        = number
  default     = 8080
}

# Optional: Define any additional variables for SonarQube
variable "sonarqube_port" {
  description = "The port where SonarQube will be accessible"
  type        = number
  default     = 9000
}

