resource "aws_security_group" "private_instance_sg" {
  name_prefix = "${var.product_name}-${var.environment}-private-instance"
  vpc_id = var.vpc_id
  # Inbound rule to allow SSH from any source
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from any source
  }
  # Outbound rule to allow all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"] # Allow all outbound traffic
  }
}
resource "aws_instance" "private_instance" {
  ami           = var.private_instance_ami
  instance_type = var.private_instance_type
  subnet_id     = var.private_subnet_id

  # Associate the security group with the EC2 instance
  vpc_security_group_ids = [aws_security_group.private_instance_sg.id]
  key_name        = var.key_name
  tags = {
    Name = "${var.product_name}-${var.environment}-private-instace"
  }
}
