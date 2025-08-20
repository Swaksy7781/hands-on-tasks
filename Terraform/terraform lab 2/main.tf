resource "aws_security_group" "creating_security_group" {
    name = var.security_group
    description = "This security group is created by saurabh. Inbound traffic allowed: SSH, HTTP and custom (8080), Outbound traffic allowed: All Traffic."

    ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow custom app port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}

resource "aws_instance" "creating_ec2" {

    ami = var.instance_ami
    instance_type = var.instance_type
    key_name = "saurabh"

    vpc_security_group_ids = [aws_security_group.creating_security_group.id]

    tags = {
    Name = "Saurabh-Terraform-EC2-Lab-Ubuntu."
  }
}