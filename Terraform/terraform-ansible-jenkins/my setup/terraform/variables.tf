variable "aws_region" {
  type        = string
  description = "The AWS region to deploy the resources in."
}

variable "project_name" {
  type        = string
  description = "A tag to name all resources created by this project."
}

variable "ami_id" {
  type        = string
  description = "The AMI ID for the EC2 instances."
}

variable "instance_type" {
  type        = string
  description = "The instance type for the EC2 instances."
}

variable "key_name" {
  type        = string
  description = "The key pair name for SSH access to the EC2 instances."
}

variable "subnet_id" {
  type        = string
  description = "The instance type for the EC2 instances."
}

variable "security_group_id" {
    type = string
    description = "security group id"  
}