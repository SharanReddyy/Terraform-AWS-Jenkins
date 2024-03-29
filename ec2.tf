# EC2 Instances with Nginx Installation

# Define security group for allowing SSH and HTTP traffic
resource "aws_security_group" "allow_ssh_http" {
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch an EC2 instance in the public subnet
resource "aws_instance" "public_instance" {
  ami                    = "ami-007020fd9c84e18c7"  # Replace with your desired AMI ID
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = aws_key_pair.ssh_key_pair.key_name
  associate_public_ip_address = true
  security_groups        = [aws_security_group.allow_ssh_http.id]  # Use security group ID

  tags = {
    Name = "public-instance"
  }

  user_data = <<-EOF
    #!/bin/bash
    apt update -y
    apt install nginx -y
    systemctl start nginx
    systemctl enable nginx
  EOF
}

# Launch an EC2 instance in the private subnet
resource "aws_instance" "private_instance" {
  ami                    = "ami-007020fd9c84e18c7"  # Replace with your desired AMI ID
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_subnet.id
  key_name               = aws_key_pair.ssh_key_pair.key_name
  security_groups        = [aws_security_group.allow_ssh_http.id]  # Use security group ID

  tags = {
    Name = "private-instance"
  }
}

