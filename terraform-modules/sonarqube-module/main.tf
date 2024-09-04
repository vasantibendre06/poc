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

resource "null_resource" "install_sonarqube" {
  provisioner "local-exec" {
    command = <<EOT
	echo "Updating and upgrading system packages" >> /var/log/user_data.log 2>&1
	sudo apt update -y >> /var/log/user_data.log 2>&1
	sudo apt upgrade -y >> /var/log/user_data.log 2>&1
	# Install prerequisites
	echo "Installing prerequisites" >> /var/log/user_data.log 2>&1
	sudo apt-get install -y openjdk-11-jdk wget unzip >> /var/log/user_data.log 2>&1
	# Download and Install SonarQube
	echo "Downloading and installing SonarQube" >> /var/log/user_data.log 2>&1
	wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.9.0.65466.zip -P /tmp >> /var/log/user_data.log 2>&1
	sudo unzip /tmp/sonarqube-9.9.0.65466.zip -d /opt >> /var/log/user_data.log 2>&1
	sudo mv /opt/sonarqube-9.9.0.65466 /opt/sonarqube >> /var/log/user_data.log 2>&1
	# Create a SonarQube user
	echo "Creating SonarQube user" >> /var/log/user_data.log 2>&1
	sudo useradd -r -s /bin/bash -d /opt/sonarqube -m -c "SonarQube user" sonarqube >> /var/log/user_data.log 2>&1
	sudo chown -R sonarqube:sonarqube /opt/sonarqube >> /var/log/user_data.log 2>&1
	# Set up SonarQube as a service
	echo "Setting up SonarQube as a service" >> /var/log/user_data.log 2>&1
	sudo bash -c 'cat <<EOF > /etc/systemd/system/sonarqube.service
	[Unit]
	Description=SonarQube service
	After=syslog.target network.target

	[Service]
	Type=forking

	ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
	ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop

	User=sonarqube
	Group=sonarqube
	Restart=always
	LimitNOFILE=65536
	LimitNPROC=4096

	[Install]
	WantedBy=multi-user.target
	EOF' >> /var/log/user_data.log 2>&1
	sudo systemctl start sonarqube >> /var/log/user_data.log 2>&1
	sudo systemctl enable sonarqube >> /var/log/user_data.log 2>&1
    EOT
  }
}
