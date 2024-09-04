output "sonarqube_service_status" {
  description = "The status of the SonarQube service"
  value       = "Sonarqube installation completed successfully."
}

output "sonarqube_url" {
  description = "The URL to access SonarQube"
  value       = "http://192.168.254.133:9000"
}

output "sonarqube_installation_directory" {
  description = "The directory where SonarQube is installed"
  value       = "/opt/sonarqube"
}

