provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "flask_sg" {

  name_prefix = "flask-security-group-"

  ingress {
    from_port   = 5001
    to_port     = 5001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
   from_port   = 5002
   to_port     = 5002
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

ingress {
  from_port   = 5003
  to_port     = 5003
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

resource "aws_instance" "devsecops_server" {

  ami           = "ami-0f58b397bc5c1f2e8"

  instance_type = "t3.micro"
  
  key_name = "devsecops-key"

  security_groups = [aws_security_group.flask_sg.name]

  tags = {
    Name = "DevSecOps-Server"
  }
}

output "ec2_public_ip" {
  value = aws_instance.devsecops_server.public_ip
}

