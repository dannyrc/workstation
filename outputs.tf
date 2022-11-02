output "os_name" {
  description = "Operating System"
  value       = data.aws_ami.ubuntu.name
}

output "image_id" {
  description = "Image ID"
  value       = data.aws_ami.ubuntu.image_id
}
