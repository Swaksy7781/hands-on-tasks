terraform {
  backend "s3" {
    bucket = "cloudhustlers-team"
    key = "Cloudhustlers.tfstate"
    region = "eu-north-1"
    use_lockfile = true
  }
  
required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}