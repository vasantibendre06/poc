output "jenkins_status" {
  value = module.jenkins.jenkins_installation_status
}

output "sonarqube_status" {
  value = module.sonarqube.sonarqube_service_status
}


