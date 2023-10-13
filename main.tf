provider "aws" {
  region = var.aws_region
}
module "my_vpc" {
  source = "./module/vpc"  # Path to the VPC module directory
  vpc_name = var.vpc_name
  vpc_cidr_block = var.vpc_cidr_block
  availability_zones =var.availability_zones
  public_subnet_cidr_blocks = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  environment = var.environment
  product_name = var.product_name
}

module "aws_key_pair" {
  source     = "./module/aws_key_pair"
  key_name   = var.key_pair_name
}

module "bastion_instance" {
  source = "./module/bastion_instance"  # Correct the source path
  product_name         = var.product_name
  environment          = var.environment
  bastion_ami          = var.bastion_ami
  bastion_instance_type = var.instance_type
  bastion_subnet_id     = module.my_vpc.public[0]
  key_name = module.aws_key_pair.key_name
  vpc_id = module.my_vpc.vpc_id
}

