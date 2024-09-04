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
	echo "Updating and upgrading system packages" >> /var/log/user_data.log 2>&1
	sudo apt update -y >> /var/log/user_data.log 2>&1
	sudo apt upgrade -y >> /var/log/user_data.log 2>&1
	# Install OpenJDK
	echo "Installing OpenJDK 21" >> /var/log/user_data.log 2>&1
	sudo apt install openjdk-21-jdk -y >> /var/log/user_data.log 2>&1
	# Add Jenkins repository and install Jenkins
	echo "Adding Jenkins repository and installing Jenkins" >> /var/log/user_data.log 2>&1
	sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  	https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key >> /var/log/user_data.log 2>&1
	echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list >> /var/log/user_data.log 2>&1
	sudo apt-get update -y >> /var/log/user_data.log 2>&1
	sudo apt-get install jenkins -y >> /var/log/user_data.log 2>&1
	sudo systemctl start jenkins >> /var/log/user_data.log 2>&1
	sudo systemctl enable jenkins >> /var/log/user_data.log 2>&1
	# Configure Jenkins user permissions
	echo "Configuring Jenkins user permissions" >> /var/log/user_data.log 2>&1
	echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/jenkins >> /var/log/user_data.log 2>&1
     EOT
   }
 }

