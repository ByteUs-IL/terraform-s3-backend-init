terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider on Ireland
provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      Environment = "Dev"
      Terraform   = true
      Application = "Terraform-Backend"
    }
  }
}