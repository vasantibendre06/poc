resource "local_file" "copy_build_files" {
  content = <<-EOT
   	whoami
  EOT
  filename = "${path.module}/copy_file.sh"
  file_permission = "0755"
}

resource "null_resource" "run_sh_file" {
  provisioner "local-exec" {
    command = "sh copy_file.sh"
  }
  depends_on = [local_file.copy_build_files]
}

output "name" {
  value = "${path.module}/copy_file.sh"
}
