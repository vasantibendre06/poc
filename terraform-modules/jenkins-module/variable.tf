# variables.tf

variable "vm_user" {
  description = "The username for the VM."
  type        = string
  default     = "vasanti"  # Replace with your local username if needed
}

variable "vm_ip" {
  description = "The IP address of the VM."
  type        = string
  default     = "192.168.254.133"  # Loopback address since it's running locally
}

variable "vm_private_key" {
  description = "Path to the private SSH key for the VM."
  type        = string
  default     = "/home/vasanti/.ssh/id_rsa"  # Default to a typical location, but it's not used locally
}

