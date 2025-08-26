output "instance_name" {
  description = "The Name tag of the EC2 instance"
  value       = aws_instance.EC2-instance.tags["Name"]
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.EC2-instance.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.EC2-instance.public_ip
}
