resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.product_name}-${var.environment}-${var.vpc_name}"
  }
}

resource "aws_subnet" "public" {
  count           = length(var.public_subnet_cidr_blocks)
  vpc_id          = aws_vpc.my_vpc.id
  cidr_block      = var.public_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.product_name}-${var.environment}-Public-Subnet-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count           = length(var.private_subnet_cidr_blocks)
  vpc_id          = aws_vpc.my_vpc.id
  cidr_block      = var.private_subnet_cidr_blocks[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${var.product_name}-${var.environment}-Private-Subnet-${count.index}"
  }
}
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.product_name}-${var.environment}-Private-Route-Table"
  }
}

# Associate the public route table with public subnets
resource "aws_route_table_association" "public_association" {
  count           = length(var.public_subnet_cidr_blocks)
  subnet_id       = aws_subnet.public[count.index].id
  route_table_id  = aws_vpc.my_vpc.default_route_table_id
}

# Associate the private route table with private subnets
resource "aws_route_table_association" "private_association" {
  count           = length(var.private_subnet_cidr_blocks)
  subnet_id       = aws_subnet.private[count.index].id
  route_table_id  = aws_route_table.private_route_table.id
}

resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "${var.product_name}-${var.environment}-Public-Internet-Gateway"
  }
}
resource "aws_route" "internet_gateway_association" {
  route_table_id         = aws_vpc.my_vpc.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_internet_gateway.id
}

resource "aws_nat_gateway" "my_nat_gateway" {
  allocation_id = aws_eip.my_eip.id
  subnet_id     = aws_subnet.public[0].id # Assuming one public subnet, update as needed
  tags = {
    Name = "${var.product_name}-${var.environment}-NAT-Gateway"
  }
}

# Create an Elastic IP (EIP) for the NAT Gateway
resource "aws_eip" "my_eip" {
  vpc = true
}

# Create a default route in the private route table pointing to the NAT Gateway
resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.my_nat_gateway.id
}