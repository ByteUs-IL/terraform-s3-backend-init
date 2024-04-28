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
  region = var.aws_region

  default_tags {
    tags = {
      Environment = "network"
      Terraform   = true
    }
  }
}
