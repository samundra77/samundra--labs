provider "aws" {
  region     = a
}

# Security group to allow HTTP and SSH traffic
resource "aws_security_group" "samundra" {
  name = "samundrasecuritypolicy"

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

resource "aws_instance" "ec2instance" {
  ami                    = "ami-0286724fac31a786d"
  instance_type          = "t2.micro"
  key_name               = "samundrakeypair"
  vpc_security_group_ids = [aws_security_group.samundra.id]

  tags = {
    Name = "samundra-terraform"
  }

  user_data = <<-EOF
              #!/bin/bash
              set -e

              # Update package index
              sudo apt update -y

              # Install Nginx
              sudo apt install -y nginx

              # Start and enable Nginx service
              sudo systemctl start nginx
              sudo systemctl enable nginx
              EOF
}


