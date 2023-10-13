variable "vpc_name" {
  description = "Name of the VPC"
}


variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
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
