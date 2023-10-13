output "bastion_public_ip" {
  description = "Public IP address of the Bastion host"
  value       = aws_instance.bastion_instance.public_ip
}

output "bastion_eip" {
  description = "Elastic IP of the Bastion host"
  value       = aws_eip.bastion_eip.public_ip
}
