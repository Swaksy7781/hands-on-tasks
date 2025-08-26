resource "aws_instance" "web_server_1" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_1.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.EC2_instance_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              echo "Hello from Saurabh's first web server!" > /var/www/html/index.html
              systemctl start apache2
              EOF

  tags = { Name = "WebServer1" }
}

resource "aws_instance" "web_server_2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public_subnet_2.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.EC2_instance_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install -y apache2
              echo "Hello from Saurabh's 2nd web server!" > /var/www/html/index.html
              systemctl start apache2
              EOF

  tags = { Name = "WebServer2" }
}