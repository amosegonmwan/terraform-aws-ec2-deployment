output "ami_id" {
  description = "Amazon Linux AMI ID from data source"
  value       = data.aws_ami.amazon_linux_2.id
}

output "http_url" {
  description = "HTTP URL to access the web server"
  value       = "http://${aws_instance.web_server.public_ip}/"
}
