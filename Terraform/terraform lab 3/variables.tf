variable "aws_region" {
  type        = string
  description = "The AWS region to deploy the resources in."
}


variable "vpc_cidr_block" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "public_subnet_1_cidr" {
  type        = string
  description = "The CIDR block for the first public subnet."
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "The CIDR block for the second public subnet."
}

variable "availability_zone_1" {
  type        = string
  description = "The availability zone for the first public subnet."
}

variable "availability_zone_2" {
  type        = string
  description = "The availability zone for the second public subnet."
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
