terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"  # or the version you're using
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"  # or the version you're using
    }
  }
}

resource "null_resource" "install_jenkins" {
  provisioner "local-exec" {
    command = <<EOT
      echo "Updating and upgrading system packages" | sudo tee -a /var/log/user_data.log
      sudo apt update -y | sudo tee -a /var/log/user_data.log
      sudo apt upgrade -y | sudo tee -a /var/log/user_data.log
      
      # Install OpenJDK
      echo "Installing OpenJDK 21" | sudo tee -a /var/log/user_data.log
      sudo apt install openjdk-21-jdk -y | sudo tee -a /var/log/user_data.log
      
      # Add Jenkins repository and install Jenkins
      echo "Adding Jenkins repository and installing Jenkins" | sudo tee -a /var/log/user_data.log
      sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee -a /var/log/user_data.log
      echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list | sudo tee -a /var/log/user_data.log
      sudo apt-get update -y | sudo tee -a /var/log/user_data.log
      sudo apt-get install jenkins -y | sudo tee -a /var/log/user_data.log
      
      # Start Jenkins and enable on boot
      echo "Starting and enabling Jenkins" | sudo tee -a /var/log/user_data.log
      sudo systemctl start jenkins | sudo tee -a /var/log/user_data.log
      sudo systemctl enable jenkins | sudo tee -a /var/log/user_data.log
      
      # Configure Jenkins user permissions
      echo "Configuring Jenkins user permissions" | sudo tee -a /var/log/user_data.log
      echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/jenkins | sudo tee -a /var/log/user_data.log
    EOT
  }
}


