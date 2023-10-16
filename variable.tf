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

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

# variable "subnet_ids" {
#   description = "List of subnet IDs where the EKS cluster will be launched"
#   type        = list(string)
# }

variable "node_group_name" {
  description = "Name of the EKS node group."
}

variable "node_group_desired_size" {
  description = "Desired size of the node group."
  type        = number
  default     = 2
}

variable "node_group_max_size" {
  description = "Maximum size of the node group."
  type        = number
  default     = 2
}

variable "node_group_min_size" {
  description = "Minimum size of the node group."
  type        = number
  default     = 1
}

variable "private_instance_ami" {
  description = "AMI ID for the Bastion host"
}

variable "private_instance_type" {
  description = "Instance type for the Bastion host"
}
