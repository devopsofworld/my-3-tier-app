variable "bastion_ami" {
  description = "AMI ID for the Bastion host"
}

variable "bastion_instance_type" {
  description = "Instance type for the Bastion host"
}

variable "bastion_subnet_id" {
  description = "ID of the subnet in which the Bastion host will be placed"
}


variable "product_name" {
  description = "The name of the product or application."
  type        = string
}

variable "environment" {
  description = "The environment (e.g., dev, stage, prod)."
  type        = string
}

variable "key_name" {
  description = "Key Name "
  
}

variable "vpc_id" {
  description = "Name of vpcid"
  
}