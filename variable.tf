variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
  default     = "us-east-1" 
}

variable "vpc_name" {
  description = "The aws region"
}

variable "vpc_cidr_block" {
    description = "The aws vpc cidr blcok"
  
}
variable "availability_zones" {
    description = "The aws vpc availabilty zones"
  
}
variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "environment" {
  description = "The environment (e.g., dev, stage, prod)"
}

variable "product_name" {
  description = "The name of the product (e.g., devopsofworld)"
}

variable "key_pair_name" {
  description = "The name of key pair"
  
}
variable "bastion_ami" {
  description = "The ID of the Bastion AMI."
}

variable "instance_type" {
  description = "The ID of the Bastion AMI."
}