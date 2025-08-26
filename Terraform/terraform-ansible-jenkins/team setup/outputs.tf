output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.team_VPC.id
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.team_VPC.cidr_block
}

output "team_subnet_id" {
  description = "The ID of subnet"
  value       = aws_subnet.team_subnet.id
}

output "security_group_id" {
  description = "The ID of the team's security group"
  value       = aws_security_group.team_security_group.id
}

output "security_group_name" {
  description = "The name of the security group"
  value       = aws_security_group.team_security_group.name
}