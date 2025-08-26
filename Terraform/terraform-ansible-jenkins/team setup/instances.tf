resource "aws_instance" "Jenkins-instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.team_subnet.id
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.team_security_group.id]

  tags = { Name = "CloudHustlers-Jenkins-instance" }
}