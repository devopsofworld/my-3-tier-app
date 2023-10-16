output "private_private_ip" {
  description = "Public IP address of the Bastion host"
  value       = aws_instance.private_instance.private_ip
}

# output "private_instace_eip" {
#   description = "Elastic IP of the Bastion host"
#   value       = aws_eip.private_instance_eip.private_ip
# }
