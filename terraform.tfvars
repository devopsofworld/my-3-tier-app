aws_region = "ap-south-1"
environment = "dev"
product_name = "devopsofworld"
# VPC DYNAMIC CHANGES
vpc_name = "vpc"
vpc_cidr_block = "10.0.0.0/16"
availability_zones = ["ap-south-1a", "ap-south-1b","ap-south-1c"]
public_subnet_cidr_blocks = [ "10.0.1.0/24","10.0.2.0/24","10.0.3.0/24" ]
private_subnet_cidr_blocks = [ "10.0.4.0/24","10.0.5.0/24","10.0.6.0/24" ]
#BASTION HOST DYNAMIC CHANGES
key_pair_name = "my-terraform-key"
bastion_ami = "ami-0a5ac53f63249fba0"
instance_type = "t2.micro"

# EKS VARIABALES
cluster_name = "myeks"
node_group_desired_size = 2
node_group_max_size = 2
node_group_min_size = 1
node_group_name = "mynodegroup"
# eks_instance_type = "t2.micro"



#private instance 
private_instance_ami = "ami-0a5ac53f63249fba0"
private_instance_type = "t2.micro"
